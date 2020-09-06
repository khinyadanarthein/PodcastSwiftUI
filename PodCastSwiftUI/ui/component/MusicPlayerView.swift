//
//  MusicPlayerView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 03/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import AVKit

struct MusicPlayerView: View {
    
    @State private var isPlaying : Bool = false

    @ObservedObject var model : MusicPlayerModel
    
    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
           NSSortDescriptor(key: "id", ascending: true)
    ]) var justListen : FetchedResults<ListenPodcast>
    
    var listen : ListenPodcast
    
    init(listenPod: ListenPodcast) {
        listen = listenPod
        model = MusicPlayerModel(song: Song(name: listen.title ?? "", url: listen.audioUrl ?? "https://www.listennotes.com/e/p/11b34041e804491b9704d11f283c74de/"))
        //model.song = Song(name: listen.title!, url: listen.audioUrl!)
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                VStack {
                    Image("Podcast-Cover-artist")
                        .resizable()
                        .frame(width: 70,height : 70)
                        .scaledToFit()
                        .padding([.leading,.top])
                    
                    
                    ActivityIndicator(isAnimating: $model.isBuffering, style: .large)
                }
                
                VStack {
                    Text("\(model.song.name)")
                    .font(.headline)
                    .foregroundColor(.white)
                        .padding([.top,.bottom])
                    
                    Text("\(model.song.name)")
                        .font(.caption)
                    .foregroundColor(.white)
                        .padding([.bottom])
                    
                    ProgressView(color: UIColor(red: 1.00, green: 0.35, blue: 0.78, alpha: 1.00), completionPercentage: $model.completionPercentage)
                                       .frame(height: 8)
                    
                    PlaybackTimerView(onGoingPlaybackTime: $model.onGoingPlaybackTime, playbackDurationTime: $model.playbackDurationTime)
                    .foregroundColor(.white)
                }
                
            }.padding([.trailing], 10)
            
            
//            VStack {
//               
//                PlaybackTimerView(onGoingPlaybackTime: $model.onGoingPlaybackTime, playbackDurationTime: $model.playbackDurationTime)
//                    .foregroundColor(.white)
//            }.padding([.leading, .trailing], 18)
            
            PlayerActionView(isPlaying: $isPlaying)
                .environmentObject(model)
                .foregroundColor(Color(.lightText))
            
        }.background(Color(UIColor(named: "musicplayercolor")!))
        
    }
    
    
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView(listenPod: ListenPodcast(context: context))
    }
}

class Song {
    var name : String
    var playbackUrl: String
    
    init(name : String, url : String) {
        self.name = name
        playbackUrl = url
    }
}

class MusicPlayerModel: ObservableObject {
    var audioPlayer : AVPlayer!
    var song : Song
//    var name : String
//    var url : String
    
    @Published var onGoingPlaybackTime : String = "0:00"
    @Published var playbackDurationTime : String = "0:00"
    @Published var playbackRange : ClosedRange<CGFloat> = 0...100
    @Published var currentPlaybackTimeInSec : CGFloat = 0
    @Published var completionPercentage : CGFloat = 0
    @Published var musicPlaybackRate: Float = 1
    @Published var isBuffering : Bool = false
    
    private var playbackDuration : CGFloat = 0
    var timeObserverToken : Any?
    
    init(song : Song) {
        self.song = song
        self.audioPlayer = AVPlayer(url: URL(string: song.playbackUrl)!)
        print(song.playbackUrl)
        addTimeObserver()
    }
    
    func getPlaybackItemInfo() {
        if let currentItem = self.audioPlayer.currentItem {
            let duration = currentItem.asset.duration
            playbackDuration = CGFloat(duration.seconds)
            playbackRange = 0...playbackDuration
            
          
            self.playbackDurationTime = TimeUtils().getSecondsTimeFormat(seconds: Int(duration.seconds))
        }
        
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
//                print("Buffering completed")
//            }
          
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
    
    func playbackRate() {
        
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


struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: style)
        view.color = .white
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
