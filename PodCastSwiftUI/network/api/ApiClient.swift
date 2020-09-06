//
//  ApiClient.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class ApiClient : BaseApiClient{
    
    static let shared : ApiClient = ApiClient()
    
    private override init() {}
    
}

extension ApiClient : Api {
    func getPlaylists(genreId: Int, page: Int, pathVariable : String, success: @escaping (EpisodeListResponse) -> Void, fail: @escaping (String) -> Void) {
        let param = [
            TYPE : "episode_list",
            LAST_TIMESTAMP : "0",
            SORT : "recent_added_first"
        ]
        
        let url = API_GET_PLAYLIST + "/\(pathVariable)"
        
        self.requestApi(url: url, method: .get, params: param, success: { (response) in
            
            let data = try! JSONDecoder().decode(EpisodeListResponse.self, from: response)
            success(data)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func getEpisode(id: String, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        
        let url = API_GET_PODCAST_DETAIL + "/abc"
        self.requestApi(url: url, method: .get, params: [:], success: { (response) in
            
            let data = try! JSONDecoder().decode(EpisodeDetailResponse.self, from : response)
            success(data)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func getJustListen(success: @escaping (ListenPodCastResponse) -> Void, fail: @escaping (String) -> Void) {
        
        let param = ["":""]
        self.requestApi(url: API_GET_PODCAST_LISTEN, method: .get, params: param, success: { (response) in
            
            let data = try! JSONDecoder().decode(ListenPodCastResponse.self, from: response)
            success(data)
            
        }) { (error) in
            fail(error)
        }
    }
    
    func getGenres(success: @escaping (GenreResponse) -> Void, fail: @escaping (String) -> Void) {
        
        let param = [TOP_LEVEL_ONLY : "0"]
        self.requestApi(url: API_GET_GENRES, method: .get, params: param, success: { (response) in
            
            let data = try! JSONDecoder().decode(GenreResponse.self, from: response)
            success(data)
            
        }) { (error) in
            fail(error)
        }
    }
    
    
}
