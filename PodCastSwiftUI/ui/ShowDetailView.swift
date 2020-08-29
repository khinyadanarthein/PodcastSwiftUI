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
    
    @State var audioPlayer:AVAudioPlayer?

    @State var isPlaying : Bool = false

    var body: some View {
        List {
            VStack(spacing : 20) {
                Image("spotless-podcast-banner")
                    .resizable()
                    .frame(height : 200)
                    .scaledToFit()
                
                Text("Designing for everyone, Everywhere with KYT")
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
                
                Text("At this point, I gave up trying to get TabView to behave like I wanted it to, considering the lack of documentation for TabView, and decided to directly use UITabBarController and embed it in SwiftUI.At this point, I gave up trying to get TabView to behave like I wanted it to, considering the lack of documentation for TabView, and decided to directly use UITabBarController and embed it in SwiftUI.At this point, I gave up trying to get TabView to behave like I wanted it to, considering the lack of documentation for TabView, and decided to directly use UITabBarController and embed it in SwiftUI.")
                    .padding()
                    .background(Color.init(UIColor.systemGray5))
                    .cornerRadius(15)
                    .multilineTextAlignment(.leading)
                
                Button(action: {

                    if let path = Bundle.main.path(forResource: "a", ofType: ".mp3") {

                        self.audioPlayer = AVAudioPlayer()

                        self.isPlaying.toggle()

                        let url = URL(fileURLWithPath: path)

                        do {
                            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                            self.audioPlayer?.prepareToPlay()
                            self.audioPlayer?.play()
                        }catch {
                            print("Error")
                        }
                    }

                }, label: {
                    Text("Play")
                })
            }.frame(maxWidth : .infinity, alignment: .leading)
            
            
        }
    }
}

struct ShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailView()
    }
}
