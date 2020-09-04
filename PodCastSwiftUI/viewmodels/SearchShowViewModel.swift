//
//  SearchShowViewModel.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 03/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

protocol SearchShowViewModel {
    
    var genres : [GenreVO] {get set}
    func fetchGenre()
}
