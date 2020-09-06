//
//  JustListenPlaybackView.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct JustListenPlaybackView : View {
    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
        NSSortDescriptor(key: "id", ascending: true)
    ]) var justListen : FetchedResults<ListenPodcast>
    
    var body : some View {
        VStack {
            HStack {
                Image(systemName: "waveform").font(.system(size: 30, weight: .regular))
                Text("PodCast")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth : .infinity, alignment: .leading)
                
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color(UIColor.lightText))
                    Image(systemName: "bell").font(.system(size: 20, weight: .regular))
                }
                
                
            }
            MusicPlayerView(song: Song(name: justListen.first?.title ?? "", url: justListen.first?.audioUrl ?? "https://www.listennotes.com/e/p/11b34041e804491b9704d11f283c74de/",image: justListen.first?.thumbnail ?? ""))
                .cornerRadius(15)
                .padding([.top, .bottom])
            
            AttributedText(justListen.last?.castDescription ?? "")
                .frame(maxWidth : .infinity, maxHeight: 100)
                .padding()
                .background(Color.init(UIColor.systemGray5))
                .cornerRadius(15)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
            
        }
           
        
    }
}

struct JustListenPlaybackView_Preview : PreviewProvider {
    static var previews: some View {
        JustListenPlaybackView()
    }
}
