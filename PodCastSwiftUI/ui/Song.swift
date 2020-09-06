//
//  Song.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class Song {
    var name : String
    var playbackUrl: String
    var imageUrl : String
    
    init(name : String, url : String, image : String) {
        self.name = name
        playbackUrl = url
        imageUrl = image
    }
}
