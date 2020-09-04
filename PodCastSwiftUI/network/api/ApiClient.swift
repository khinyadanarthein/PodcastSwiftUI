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
    func getPlaylists(genreId: Int, page: Int, success: @escaping (EpisodeListResponse) -> Void, fail: @escaping (String) -> Void) {
        
    }
    
    func getEpisode(id: Int, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void) {
        
    }
    
    func getJustListen(success: @escaping (ListenPodCastResponse) -> Void, fail: @escaping (String) -> Void) {
        
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
