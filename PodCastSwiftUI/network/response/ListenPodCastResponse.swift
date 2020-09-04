//
//  ListenPodCastResponse.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation

// MARK: - ListenPodCastResponse
class ListenPodCastResponse: Codable {
    let id, title, listenPodCastResponseDescription: String
    let pubDateMS: Int
    let audio: String
    let audioLengthSEC: Int
    let listennotesURL: String
    let image, thumbnail: String
    let maybeAudioInvalid: Bool
    let listennotesEditURL: String
    let explicitContent: Bool
    let link: String
    let podcast: PodcastData

    enum CodingKeys: String, CodingKey {
        case id, title
        case listenPodCastResponseDescription = "description"
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

    init(id: String, title: String, listenPodCastResponseDescription: String, pubDateMS: Int, audio: String, audioLengthSEC: Int, listennotesURL: String, image: String, thumbnail: String, maybeAudioInvalid: Bool, listennotesEditURL: String, explicitContent: Bool, link: String, podcast: PodcastData) {
        self.id = id
        self.title = title
        self.listenPodCastResponseDescription = listenPodCastResponseDescription
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
class PodcastData: Codable {
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
