//
//  GenreResponse.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 01/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import Combine

// MARK: - GenreResponse
class GenreResponse: Codable {
    var genres: [GenreVO]

    init(genres: [GenreVO]) {
        self.genres = genres
    }
}

// MARK: - Genre
class GenreVO: Codable {
    var id: Int
    var name: String
    var parentID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
    }

    init(id: Int, name: String, parentID: Int?) {
        self.id = id
        self.name = name
        self.parentID = parentID
    }
}
