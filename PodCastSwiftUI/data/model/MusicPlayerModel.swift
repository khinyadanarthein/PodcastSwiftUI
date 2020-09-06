//
//  MusicPlayerModel.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import MediaPlayer
import Combine
import AVFoundation



class MusicPlayerModel: ObservableObject {
    var audioPlayer : AVPlayer!
    var song : Song!
    
    static let shared = MusicPlayerModel()
    
    @Published var onGoingPlaybackTime : String = "0:00"
    @Published var playbackDurationTime : String = "0:00"
    @Published var playbackRange : ClosedRange<CGFloat> = 0...100
    @Published var currentPlaybackTimeInSec : CGFloat = 0
    @Published var completionPercentage : CGFloat = 0
    @Published var musicPlaybackRate: Float = 1
    @Published var isBuffering : Bool = false
    @Published var isPlaying : Bool = false
    
    private var playbackDuration : CGFloat = 0
    var timeObserverToken : Any?
    
    public init() {}
    
    func startPlayer(song : Song) {
        //Not a good solution. TODO: Fix
        if !isPlaying {
            self.song = song
            self.audioPlayer = AVPlayer(url: URL(string: song.playbackUrl)!)
            setupConfig()
        }
    }
    
    func setupConfig() {
        addTimeObserver()
        setupRemoteTransportControls()
    }
    
    func getPlaybackItemInfo() {
        if let currentItem = self.audioPlayer.currentItem {
            let duration = currentItem.asset.duration
            playbackDuration = CGFloat(duration.seconds)
            playbackRange = 0...playbackDuration
            
            
            self.playbackDurationTime = TimeUtils().getSecondsTimeFormat(seconds: Int(duration.seconds))
        }
        
        self.isPlaying = (self.audioPlayer.rate != 0 && self.audioPlayer.error == nil)
        
    }
    
    func calculateCompletionPercentage() {
        completionPercentage = (currentPlaybackTimeInSec / playbackDuration) * 100
    }
    
    func addTimeObserver() {
        // Invoke callback every half second
        let interval = CMTime(seconds: 0.5,
                              preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        
        //Add time observer. Invoke closure on the main queue.
        timeObserverToken = self.audioPlayer.addPeriodicTimeObserver(forInterval: interval, queue: .main) {
            [weak self] time in
            self?.getPlaybackItemInfo()
            self?.currentPlaybackTimeInSec = CGFloat(time.seconds)
            self?.onGoingPlaybackTime = TimeUtils().getSecondsTimeFormat(seconds: Int(time.seconds))
            self?.calculateCompletionPercentage()
            
            let playbackLikelyToKeepUp = self?.audioPlayer.currentItem?.isPlaybackLikelyToKeepUp ?? false
            self?.isBuffering = !playbackLikelyToKeepUp
            //            if playbackLikelyToKeepUp == false{
            //                print("IsBuffering")
            //            } else {
            //                //stop the activity indicator
            //                print("Buffering completed"
            //            }
            
            
            self?.setupNowPlaying()
        }
    }
    
    /*
     A value of 0.0 pauses the video, while a value of 1.0 plays the current item at its natural rate.
     */
    func manipulatePlaybackRate() {
        //Allows 2x as maximum
        if musicPlaybackRate == 2.0 {
            musicPlaybackRate = 1
        } else if musicPlaybackRate == 0.5 {
            musicPlaybackRate += 0.5
        } else {
            musicPlaybackRate += 0.5
        }
        
        self.audioPlayer.rate = musicPlaybackRate
    }
    
    func skipForward30sec() {
        let timeToSkipTo = self.audioPlayer.currentTime().seconds + 30
        self.audioPlayer.seek(to: CMTime(seconds: timeToSkipTo, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
    }
    
    func skipBackward15sec() {
        let timeToSkipBack = self.audioPlayer.currentTime().seconds - 15
        self.audioPlayer.seek(to: CMTime(seconds: timeToSkipBack, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
    }
    
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.audioPlayer.rate == 0.0 {
                self.audioPlayer.play()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.audioPlayer.rate == 1.0 {
                self.audioPlayer.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = song.name
        
        //        if let image = UIImage(named: "lockscreen") {
        //            nowPlayingInfo[MPMediaItemPropertyArtwork] =
        //                MPMediaItemArtwork(boundsSize: image.size) { size in
        //                    return image
        //            }
        //        }
        
        if let playerItem = self.audioPlayer.currentItem {
            nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = playerItem.currentTime().seconds
            nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = playerItem.asset.duration.seconds
        }
        
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = audioPlayer.currentTime().seconds
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = audioPlayer.rate
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    func cleanUp() {
        if let token = timeObserverToken {
            self.audioPlayer.removeTimeObserver(token)
        }
    }
    
    deinit {
        cleanUp()
    }
}

