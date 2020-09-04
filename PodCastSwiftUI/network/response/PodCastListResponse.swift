//
//  PodCastListResponse.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

class EpisodeListResponse: Codable {
    let type: String
    let items: [EpisodeData]
    let id, name, podCastListResponseDescription: String
    let image, thumbnail: String
    let visibility: String
    let total: Int
    let listennotesURL: String
    let lastTimestampMS: Int

    enum CodingKeys: String, CodingKey {
        case type, items, id, name
        case podCastListResponseDescription = "description"
        case image, thumbnail, visibility, total
        case listennotesURL = "listennotes_url"
        case lastTimestampMS = "last_timestamp_ms"
    }

    init(type: String, items: [EpisodeData], id: String, name: String, podCastListResponseDescription: String, image: String, thumbnail: String, visibility: String, total: Int, listennotesURL: String, lastTimestampMS: Int) {
        self.type = type
        self.items = items
        self.id = id
        self.name = name
        self.podCastListResponseDescription = podCastListResponseDescription
        self.image = image
        self.thumbnail = thumbnail
        self.visibility = visibility
        self.total = total
        self.listennotesURL = listennotesURL
        self.lastTimestampMS = lastTimestampMS
    }
}

// MARK: - EpisodeVO
class EpisodeData: Codable {
    let id: Int
    let type: EpisodeEnum
    let notes: String
    let addedAtMS: Int
    let data: EpisodeVO

    enum CodingKeys: String, CodingKey {
        case id, type, notes
        case addedAtMS = "added_at_ms"
        case data
    }

    init(id: Int, type: EpisodeEnum, notes: String, addedAtMS: Int, data: EpisodeVO) {
        self.id = id
        self.type = type
        self.notes = notes
        self.addedAtMS = addedAtMS
        self.data = data
    }
}

// MARK: - DataClass
class EpisodeVO: Codable {
    let id, title, dataDescription: String
    let pubDateMS: Int
    let audio: String
    let audioLengthSEC: Int
    let listennotesURL: String
    let image, thumbnail: String
    let maybeAudioInvalid: Bool
    let listennotesEditURL: String
    let explicitContent: Bool
    let link: String
    let podcast: PodcastInfo

    enum CodingKeys: String, CodingKey {
        case id, title
        case dataDescription = "description"
        case pubDateMS = "pub_date_ms"
        case audio
        case audioLengthSEC = "audio_length_sec"
        case listennotesURL = "listennotes_url"
        case image, thumbnail
        case maybeAudioInvalid = "maybe_audio_invalid"
        case listennotesEditURL = "listennotes_edit_url"
        case explicitContent = "explicit_content"
        case link, podcast
    }

    init(id: String, title: String, dataDescription: String, pubDateMS: Int, audio: String, audioLengthSEC: Int, listennotesURL: String, image: String, thumbnail: String, maybeAudioInvalid: Bool, listennotesEditURL: String, explicitContent: Bool, link: String, podcast: PodcastInfo) {
        self.id = id
        self.title = title
        self.dataDescription = dataDescription
        self.pubDateMS = pubDateMS
        self.audio = audio
        self.audioLengthSEC = audioLengthSEC
        self.listennotesURL = listennotesURL
        self.image = image
        self.thumbnail = thumbnail
        self.maybeAudioInvalid = maybeAudioInvalid
        self.listennotesEditURL = listennotesEditURL
        self.explicitContent = explicitContent
        self.link = link
        self.podcast = podcast
    }
}

// MARK: - Podcast
class PodcastInfo: Codable {
    let id, title, publisher: String
    let image, thumbnail: String
    let listennotesURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, publisher, image, thumbnail
        case listennotesURL = "listennotes_url"
    }

    init(id: String, title: String, publisher: String, image: String, thumbnail: String, listennotesURL: String) {
        self.id = id
        self.title = title
        self.publisher = publisher
        self.image = image
        self.thumbnail = thumbnail
        self.listennotesURL = listennotesURL
    }
}

enum EpisodeEnum: String, Codable {
    case episode = "episode"
}
