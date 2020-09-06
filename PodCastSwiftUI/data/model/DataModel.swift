//
//  DataModel.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

protocol DataModel {
    
    func getEpisodeList(genreId : Int, page: Int)
    
    func getEpisodeDetail(id : String, success: @escaping (EpisodeDetailResponse) -> Void, fail: @escaping (String) -> Void)
    func getEpisodeDetail(id : String)
    
    func getListenPodCast()
    
    func getGenreList()
    
}
