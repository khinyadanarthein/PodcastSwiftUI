//
//  PostCastDetailResponse.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 02/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let castDetailResponse = try? newJSONDecoder().decode(CastDetailResponse.self, from: jsonData)

// MARK: - EpisodeDetailResponse
class EpisodeDetailResponse: Codable {
    let id, title, castDetailResponseDescription: String
    let pubDateMS: Int
    let audio: String
    let audioLengthSEC: Int
    let listennotesURL: String
    let image, thumbnail: String
    let maybeAudioInvalid: Bool
    let listennotesEditURL: String
    let explicitContent: Bool
    let link: String
    let podcast: PodcastVO

    enum CodingKeys: String, CodingKey {
        case id, title
        case castDetailResponseDescription = "description"
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

    init(id: String, title: String, castDetailResponseDescription: String, pubDateMS: Int, audio: String, audioLengthSEC: Int, listennotesURL: String, image: String, thumbnail: String, maybeAudioInvalid: Bool, listennotesEditURL: String, explicitContent: Bool, link: String, podcast: PodcastVO) {
        self.id = id
        self.title = title
        self.castDetailResponseDescription = castDetailResponseDescription
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
class PodcastVO: Codable {
    let id, title, publisher: String
    let image, thumbnail: String
    let listennotesURL: String
    let totalEpisodes: Int
    let explicitContent: Bool
    let podcastDescription: String
    let itunesID: Int
    let rss: String
    let latestPubDateMS, earliestPubDateMS: Int
    let language, country: String
    let website: String
    let extra: Extra
    let isClaimed: Bool
    let email, type: String
    let lookingFor: LookingFor
    let genreIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case id, title, publisher, image, thumbnail
        case listennotesURL = "listennotes_url"
        case totalEpisodes = "total_episodes"
        case explicitContent = "explicit_content"
        case podcastDescription = "description"
        case itunesID = "itunes_id"
        case rss
        case latestPubDateMS = "latest_pub_date_ms"
        case earliestPubDateMS = "earliest_pub_date_ms"
        case language, country, website, extra
        case isClaimed = "is_claimed"
        case email, type
        case lookingFor = "looking_for"
        case genreIDS = "genre_ids"
    }

    init(id: String, title: String, publisher: String, image: String, thumbnail: String, listennotesURL: String, totalEpisodes: Int, explicitContent: Bool, podcastDescription: String, itunesID: Int, rss: String, latestPubDateMS: Int, earliestPubDateMS: Int, language: String, country: String, website: String, extra: Extra, isClaimed: Bool, email: String, type: String, lookingFor: LookingFor, genreIDS: [Int]) {
        self.id = id
        self.title = title
        self.publisher = publisher
        self.image = image
        self.thumbnail = thumbnail
        self.listennotesURL = listennotesURL
        self.totalEpisodes = totalEpisodes
        self.explicitContent = explicitContent
        self.podcastDescription = podcastDescription
        self.itunesID = itunesID
        self.rss = rss
        self.latestPubDateMS = latestPubDateMS
        self.earliestPubDateMS = earliestPubDateMS
        self.language = language
        self.country = country
        self.website = website
        self.extra = extra
        self.isClaimed = isClaimed
        self.email = email
        self.type = type
        self.lookingFor = lookingFor
        self.genreIDS = genreIDS
    }
}

// MARK: - Extra
class Extra: Codable {
    let twitterHandle, facebookHandle, instagramHandle, wechatHandle: String
    let patreonHandle, youtubeURL, linkedinURL, spotifyURL: String
    let googleURL, url1, url2, url3: String

    enum CodingKeys: String, CodingKey {
        case twitterHandle = "twitter_handle"
        case facebookHandle = "facebook_handle"
        case instagramHandle = "instagram_handle"
        case wechatHandle = "wechat_handle"
        case patreonHandle = "patreon_handle"
        case youtubeURL = "youtube_url"
        case linkedinURL = "linkedin_url"
        case spotifyURL = "spotify_url"
        case googleURL = "google_url"
        case url1, url2, url3
    }

    init(twitterHandle: String, facebookHandle: String, instagramHandle: String, wechatHandle: String, patreonHandle: String, youtubeURL: String, linkedinURL: String, spotifyURL: String, googleURL: String, url1: String, url2: String, url3: String) {
        self.twitterHandle = twitterHandle
        self.facebookHandle = facebookHandle
        self.instagramHandle = instagramHandle
        self.wechatHandle = wechatHandle
        self.patreonHandle = patreonHandle
        self.youtubeURL = youtubeURL
        self.linkedinURL = linkedinURL
        self.spotifyURL = spotifyURL
        self.googleURL = googleURL
        self.url1 = url1
        self.url2 = url2
        self.url3 = url3
    }
}

// MARK: - LookingFor
class LookingFor: Codable {
    let sponsors, guests, cohosts, crossPromotion: Bool

    enum CodingKeys: String, CodingKey {
        case sponsors, guests, cohosts
        case crossPromotion = "cross_promotion"
    }

    init(sponsors: Bool, guests: Bool, cohosts: Bool, crossPromotion: Bool) {
        self.sponsors = sponsors
        self.guests = guests
        self.cohosts = cohosts
        self.crossPromotion = crossPromotion
    }
}
