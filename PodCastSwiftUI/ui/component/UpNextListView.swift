//
//  UpNextListView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 27/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import AVFoundation

struct UpNextListView: View {
    
    @State var value : CGFloat = 10
    @State var episode : Episode
    
    var body: some View {
        
        HStack {
            ImageFromUrlView(withURL: episode.imageUrl ?? "")
            
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    Text("Web Design")
                        .padding([.leading,.trailing])
                        .padding([.top, .bottom], 8)
                        .background(Color(UIColor(named: "sky-blue")!))
                        .cornerRadius(15)
                    Text(episode.title ?? "Sample title")
                        .font(.system(size: 15, weight: .bold))
                        .lineLimit(2)
                    
                    HStack {
                        ProgressView(color : UIColor(named: "sky-blue")!, completionPercentage: $value)
                            .frame(height: 7)
                        
                        
                        Text("\(Utils.shared.secondsToHoursMinutes(seconds: Int(episode.audioLengthSec))) left").font(.system(size: 13))
                    }.frame(maxWidth: .infinity)
                    
                    
                }.frame(maxWidth : .infinity, maxHeight: .infinity)
                
                Image(systemName: "icloud.and.arrow.down").font(.system(size: 25, weight: .regular))
                    .foregroundColor(Color.pink)
                    .onTapGesture {
                        let audioUrl = self.episode.audioUrl ?? ""
                        let audioFile = URL(string: audioUrl)!
                        do {
//                            try audioFile.download(to: .documentDirectory) { url, error in
//                                guard let url = url else { return }
//                                AVPlayer(url: url).play()
//                                self.player = AVPlayer(url: url)
//                                self.player.play()
//                            }
                        } catch {
                            print(error)
                        }
                        
                }
                
            }
            
        }
    }
}

struct UpNextListView_Previews: PreviewProvider {
    static var previews: some View {
        UpNextListView(episode: Episode(context: context))
    }
}

struct ImageFromUrlView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .frame(width: 100, height: 150, alignment: .leading)
            .scaledToFit()
            .cornerRadius(20)
            .padding([.top, .bottom])
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
    
    //    var body: some View {
    //        Image(systemName: "podcast")
    //            .resizable()
    //            .frame(width: 100, height: 150, alignment: .leading)
    //            .scaledToFit()
    //            .cornerRadius(20)
    //            .padding([.top, .bottom])
    //    }
}
