//
//  UpNextListView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 27/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import AVFoundation
import Combine

struct UpNextListView: View {
    
    @State var value : CGFloat = 10
    @State var episode : Episode
    
    @ObservedObject var download = DownloadModel()

    var body: some View {
        
        HStack {
            ImageFromUrlView(withURL: episode.imageUrl ?? "")
            
//            Image(uiImage: UIImage(named: "podcast-space")!)
//            .resizable()
//            .renderingMode(.original)
//            .frame(height : 100)
//            .scaledToFit()
//            .cornerRadius(30)
//            .padding([.leading, .trailing], 30)
                
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    Text("Web Design")
                        .padding([.leading,.trailing])
                        .padding([.top, .bottom], 8)
                        .background(Color(UIColor(named: "sky-blue")!))
                        .cornerRadius(15)
                        .foregroundColor(.black)
                    
                    Text(episode.title ?? "Sample title")
                        .font(.system(size: 15, weight: .bold))
                        .lineLimit(2)
                        .foregroundColor(.black)
                    
                    HStack {
                        ProgressView(color : UIColor(named: "sky-blue")!, completionPercentage: $value)
                            .frame(height: 7)
                        
                        
                        Text("\(Utils.shared.secondsToHoursMinutes(seconds: Int(episode.audioLengthSec))) left").font(.system(size: 13))
                            .foregroundColor(.black)
                    }.frame(maxWidth: .infinity)
                    
                    
                }.frame(maxWidth : .infinity, maxHeight: .infinity)
                
                VStack {
                Image(systemName: "icloud.and.arrow.down").font(.system(size: 25, weight: .regular))
                    .foregroundColor(Color.pink)
                    .onTapGesture {
                        print("download")
                        self.download.isDownloading = true
                        
                        let audioUrl = self.episode.audioUrl ?? ""
                        let audioFile = URL(string: audioUrl)!
                        do {
                            try audioFile.download(to: .documentDirectory) { url, error in
                                
                                guard let url = url else { return }
                                print(url)
                                self.download.isDownloading = false
                                let userCast = UserPodcast(context: context)
                                userCast.id = self.episode.id
                                userCast.title = self.episode.title
                                userCast.castDescription = self.episode.episodeDescription
                                userCast.imageUrl = self.episode.imageUrl
                                userCast.audioUrl = url.absoluteString
                                userCast.audioLength = self.episode.audioLengthSec
                                
                                print(userCast.audioUrl!)
                                do {
                                    try context.save()
                                }
                                catch {
                                    print("fail to save")
                                }
                                
                            }
                        } catch {
                            print(error)
                        }
                        
                }
                    ActivityIndicator(isAnimating: $download.isDownloading, style: .large)
                        
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
            .renderingMode(.original)
            .frame(width: 100, height: 150, alignment: .leading)
            .foregroundColor(.none)
            .scaledToFit()
            .cornerRadius(20)
            .padding([.top, .bottom])
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
    
}

class DownloadModel : ObservableObject {
    
    @Published var isDownloading = false
}
