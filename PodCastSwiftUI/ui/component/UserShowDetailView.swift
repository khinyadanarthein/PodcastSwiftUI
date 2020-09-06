//
//  UserShowDetailView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 06/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct UserShowDetailView: View {
    
        var detail : UserPodcast
        
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

                    AttributedText(detail.castDescription ?? "")
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

struct UserShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserShowDetailView(detail: UserPodcast(context: context))
    }
}
