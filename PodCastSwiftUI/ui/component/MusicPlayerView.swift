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
    
//    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
//           NSSortDescriptor(key: "id", ascending: true)
//    ]) var justListen : FetchedResults<ListenPodcast>
        
    init(song : Song) {
        model = MusicPlayerModel.shared
        model.startPlayer(song: song)
        print("\(song.playbackUrl)")
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

            PlayerActionView(isPlaying: $model.isPlaying)
                .environmentObject(model)
                .foregroundColor(Color(.lightText))
            
        }.background(Color(UIColor(named: "musicplayercolor")!))
        
    }
    
    
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView(song: Song(name: "", url: "", image: ""))
    }
}
