//
//  MusicPlayerView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 03/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import AVKit
import MediaPlayer

struct MusicPlayerView: View {
    
    @State private var isPlaying : Bool = false

    @ObservedObject var model : MusicPlayerModel
    
    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
           NSSortDescriptor(key: "id", ascending: true)
    ]) var justListen : FetchedResults<ListenPodcast>
        
    init(listenPod: ListenPodcast?) {
        model = MusicPlayerModel(song: Song(name: listenPod?.title ?? "", url: listenPod?.audioUrl ?? "https://www.listennotes.com/e/p/11b34041e804491b9704d11f283c74de/"))
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
