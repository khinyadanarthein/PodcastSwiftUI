//
//  ShowDetailView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import AVKit

struct ShowDetailView: View {
    
//    @State var audioPlayer:AVAudioPlayer?
//
//    @State var isPlaying : Bool = false
//
//    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
//           NSSortDescriptor(key: "id", ascending: true)
//    ]) var justListen : FetchedResults<ListenPodcast>
//
    var detail : Episode
    
    @ObservedObject var model = DataModelImpl()
    
    var body: some View {
        //Text("HEllO")
        ScrollView {
            VStack(spacing : 20) {
                ImageFromUrlView(withURL: detail.imageUrl ?? "")
                //Image("spotless-podcast-banner")
//                    .resizable()
//                    .frame(height : 200)
//                    .scaledToFit()

                Text(self.detail.title ?? "")
                    .font(.system(size: 18, weight: .bold))

                HStack (spacing : 20){
                    HStack (spacing : 5) {
                        Image(systemName: "clock").font(.system(size: 16, weight: .regular)).foregroundColor(Color.black)

                        Text("12m")
                    }

                    HStack (spacing : 5){
                        Image(systemName: "flame").font(.system(size: 16, weight: .regular)).foregroundColor(Color.pink)

                        Text("88")
                    }

                    HStack (spacing : 5){
                        Image(systemName: "text.bubble").font(.system(size: 16, weight: .regular)).foregroundColor(.black)
                        Text("10")
                    }
                }.scaledToFill()
                    .frame(maxWidth : .infinity,alignment : .leading)
                    .padding([.leading, .trailing], 5)

                AttributedText(detail.episodeDescription ?? "")
                    .padding()
                    .background(Color.init(UIColor.systemGray5))
                    .cornerRadius(15)
                    .multilineTextAlignment(.leading)

                MusicPlayerView(song: Song(name: detail.title!, url: detail.audioUrl!, image: detail.imageUrl!))
                    .cornerRadius(15)
                    .padding([.top, .bottom])

            }.frame(maxWidth : .infinity, alignment: .leading)


            }
//        .onAppear(perform: {
//            self.model.getEpisodeDetail(id: "abc")
//        })
        .padding([.leading, .trailing])
    }
}

struct ShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailView(detail: Episode(context: context))
    }
}
