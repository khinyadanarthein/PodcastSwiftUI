//
//  DataModel.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

protocol DataModel {
    
    func getEpisodeList(genreId : Int, page: Int, success: @escaping (EpisodeData) -> Void, fail: @escaping (String) -> Void)
    
    func getEpisodeDetail(id : Int, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void)
    
    func getListenPodCast(success: @escaping (ListenPodCastResponse) -> Void, fail: @escaping (String) -> Void)
    
    func getGenreList(success: @escaping ([GenreVO]) -> Void, fail: @escaping (String) -> Void)
    
}
