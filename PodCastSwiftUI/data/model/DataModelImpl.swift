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
    
//    @Published var episodeDetail = Episode(context: context)
    
//    @Published var musicPlayer = MusicPlayerModel()
    
//    @Published var episodeList = [Episode]()
    
    init() {}

}

extension DataModelImpl : DataModel{
    
    
    func getEpisodeList(genreId: Int, page: Int) {
        
        api.getPlaylists(genreId: genreId, page: page,pathVariable: "abc", success: { (response) in
            
            //success(response.items)
//            var episodes = [Episode]()
            
            for episode in response.items {
                if !Utils.shared.isExist(id: String(episode.id), entity: "Episode") {
                    let data = Episode(context :context)
                    data.id = "\(episode.id)"
                    data.title = episode.data.title
                    data.audioLengthSec = Int64(episode.data.audioLengthSEC)
                    data.audioUrl = episode.data.audio
                    data.episodeDescription = episode.data.dataDescription
                    data.imageUrl = episode.data.image
                    data.link = episode.data.link
//                    episodes.append(data)
                
                }
            }
//            self.episodeList = episodes
            do {
                try context.save()
            } catch {
                print("fail to save")
            }
            
        }) { (error) in
            
        }
    }
    func getEpisodeDetail(id: String, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        
    }
    
    func getEpisodeDetail(id: String) {

            api.getEpisode(id: id, success: { (response) in
                
                let episode = Episode()
                episode.id = response.id
                episode.title = response.title
                episode.imageUrl = response.thumbnail
                episode.episodeDescription = response.castDetailResponseDescription
                episode.audioLengthSec = Int64(response.audioLengthSEC)
                episode.audioUrl = response.audio
                
//                self.episodeDetail = episode
                
//                self.musicPlayer = MusicPlayerModel()
//                let song = Song(name: response.title, url: response.audio)
//                self.musicPlayer.song = song
                do {
                    try context.save()
                } catch {
                    print("fail to save")
                }
                
            }) { (error) in
                print(error)
            }
    }
    
    func getListenPodCast() {
        
        api.getJustListen(success: { (data) in

            let entity = String(describing: ListenPodcast.self)
            
            if !Utils.shared.isExist(id: data.id, entity: entity) {
                
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
                
                
                do {
                    try context.save()
                
                } catch {
                    print("fail to save")
                }
                
            }

            
            //success(data)
            
        }) { (error) in
            print(error)
        }
    }
    
    func getGenreList() {
        
        api.getGenres(success: { (response) in
            
            for data in response.genres {
                if !Utils.shared.isExist(id: "\(data.id)", entity: "Genre") {
                    let genre = Genre(context: context)
                    genre.id = Int64(data.id)
                    genre.name = data.name
                    genre.parentId = Int64(data.parentID ?? 0)
                }
                
            }
            
            do {
                try context.save()
            
            } catch {
                print("fail to save")
            }
            
        }) { (error) in
            //fail(error)
        }
    }
    
    
}
