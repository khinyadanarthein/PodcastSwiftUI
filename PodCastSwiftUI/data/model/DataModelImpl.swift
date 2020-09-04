//
//  DataModelImpl.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class DataModelImpl {
    
    static let shared : DataModelImpl = DataModelImpl()
    let api : Api = ApiClient.shared
    
    private init() {}

}

extension DataModelImpl : DataModel {
    func getEpisodeList(genreId: Int, page: Int, success: @escaping (EpisodeData) -> Void, fail: @escaping (String) -> Void) {
        
    }
    
    func getEpisodeDetail(id: Int, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void) {
            
    }
    
    func getListenPodCast(success: @escaping (ListenPodCastResponse) -> Void, fail: @escaping (String) -> Void) {
        
    }
    
    func getGenreList(success: @escaping ([GenreVO]) -> Void, fail: @escaping (String) -> Void) {
        
        api.getGenres(success: { (response) in
            
            let genres = [GenreVO(id: 1, name: "Tech", parentID: 1), GenreVO(id: 2, name: "IT", parentID: 2)]
            success(genres)
            //success(response.genres)
            
        }) { (error) in
            fail(error)
        }
    }
    
    
}
