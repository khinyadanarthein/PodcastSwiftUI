//
//  Api.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

protocol Api {
    
    func getPlaylists(genreId : Int, page: Int, success: @escaping (EpisodeListResponse) -> Void, fail: @escaping (String) -> Void)
    
    func getEpisode(id : Int, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void)
    
    func getJustListen(success: @escaping (ListenPodCastResponse) -> Void, fail: @escaping (String) -> Void)
    
    func getGenres(success: @escaping (GenreResponse) -> Void, fail: @escaping (String) -> Void)
}
