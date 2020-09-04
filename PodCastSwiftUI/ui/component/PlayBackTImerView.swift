//
//  PlayBackTImerView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 03/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct PlayerActionView : View {
    private let defaultSizePlayBackIconsWidth : CGFloat = 20
    private let defaultSizePlayBackIconsHeight : CGFloat = 25
    @Binding var isPlaying : Bool
    @EnvironmentObject var model : MusicPlayerModel
    
    var body : some View {
        HStack {
            Text("\(String(format: "%.1f", model.musicPlaybackRate))x")
                .font(.headline)
                .padding()
                .onTapGesture {
                    //Manipulate Rate
                    self.model.manipulatePlaybackRate()
            }
                
            
            Image(systemName: "gobackward.15")
                .resizable()
                .frame(width: defaultSizePlayBackIconsWidth, height: defaultSizePlayBackIconsHeight)
                .padding()
                .onTapGesture {
                    self.model.skipBackward15sec()
            }
            
            ZStack {
                if isPlaying {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: defaultSizePlayBackIconsWidth, height: defaultSizePlayBackIconsHeight)
                        .padding()
                        .onTapGesture {
                            self.model.audioPlayer.pause()
                            self.isPlaying = false
                    }
                } else {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: defaultSizePlayBackIconsWidth, height: defaultSizePlayBackIconsHeight)
                        .padding()
                        .onTapGesture {
                            
                            self.model.audioPlayer.play()
                            self.isPlaying = true
                    }
                    
                }
            }
            
            Image(systemName: "goforward.30")
                .resizable()
                .frame(width: defaultSizePlayBackIconsWidth, height: defaultSizePlayBackIconsHeight)
                .padding()
                .onTapGesture {
                    self.model.skipForward30sec()
            }
            
            Image(systemName: "moon.zzz")
                .resizable()
                .frame(width: defaultSizePlayBackIconsWidth, height: defaultSizePlayBackIconsHeight)
                .padding()
                .onTapGesture {
                    self.model.skipForward30sec()
            }
            
        }
    }
}


struct PlayerActionView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerActionView(isPlaying: .constant(true))
    }
}


struct PlaybackTimerView : View {
    @Binding var onGoingPlaybackTime : String
    @Binding var playbackDurationTime : String
    var body : some View {
        HStack {
            Text(onGoingPlaybackTime)
            Spacer()
            Text(playbackDurationTime)
        }
    }
}

//https://stackoverflow.com/questions/26794703/swift-integer-conversion-to-hours-minutes-seconds
class TimeUtils {
    func hmsFrom(seconds: Int, completion: (_ hours: Int, _ minutes: Int, _ seconds: Int)->()) {
        completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func getStringFrom(seconds: Int) -> String {
        
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
    
    //00:00:00
    func getSecondsTimeFormat(seconds : Int) -> String {
        var result = ""
        hmsFrom(seconds: seconds) { hours, minutes, seconds in
            let hours = self.getStringFrom(seconds: hours)
            let minutes = self.getStringFrom(seconds: minutes)
            let seconds = self.getStringFrom(seconds: seconds)
            result =  "\(hours):\(minutes):\(seconds)"
        }
        
        return result
    }
}

