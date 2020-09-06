//
//  DataModelImpl.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Combine
import CoreData

class DataModelImpl : ObservableObject {
    
    //static let shared : DataModelImpl = DataModelImpl()
    let api : Api = ApiClient.shared
   
    @Published var episodeData = [EpisodeData]()
    
    @Published var justListenCast = ListenPodcast(context: context)
    
    init() {}

}

extension DataModelImpl : DataModel{
    
    
    func getEpisodeList(genreId: Int, page: Int) {
        
        api.getPlaylists(genreId: genreId, page: page,pathVariable: "abc", success: { (response) in
            
            //success(response.items)
            
            for episode in response.items {
                if !Utils.shared.isExist(id: String(episode.id), entity: "Episode") {
                    let data = Episode(context :context)
                    data.id = Int64(episode.id)
                    data.title = episode.data.title
                    data.audioLengthSec = Int64(episode.data.audioLengthSEC)
                    data.audioUrl = episode.data.audio
                    data.episodeDescription = episode.data.dataDescription
                    data.imageUrl = episode.data.image
                    data.link = episode.data.link
                }
            }
            
            do {
                try context.save()
            
            } catch {
                print("fail to save")
            }
            
        }) { (error) in
            
        }
    }
    
    func getEpisodeDetail(id: Int) {
            
    }
    
    func getListenPodCast() {
        
        api.getJustListen(success: { (data) in
            
            let listen = ListenPodcast(context :context)
            listen.id = data.id
            listen.title = data.title
            listen.castDescription = data.listenPodCastResponseDescription
            listen.audioUrl = data.audio
            listen.audioLength = Int64(data.audioLengthSEC)
            listen.link = data.link
            listen.listennoteUrl = data.listennotesURL
            listen.publishDate = "\(data.pubDateMS)"
            listen.thumbnail = data.thumbnail
            
            let entity = String(describing: ListenPodcast.self)
            if !Utils.shared.isExist(id: data.id, entity: entity) {
                
                do {
                    try context.save()
                
                } catch {
                    print("fail to save")
                }
                
            }
            self.justListenCast = listen
            
            
            //success(data)
            
        }) { (error) in
            print(error)
        }
    }
    
    func getGenreList() {
        
        api.getGenres(success: { (response) in
            
            //success(genres)
            //success(response.genres)
            
        }) { (error) in
            //fail(error)
        }
    }
    
    
}
