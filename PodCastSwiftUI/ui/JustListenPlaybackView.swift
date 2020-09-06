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
        Section(header: PodCastHeaderSection().background(Color(UIColor.white))) {
            
            MusicPlayerView(listenPod: justListen.last)
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
