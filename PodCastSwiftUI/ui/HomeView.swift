//
//  HomeView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @ObservedObject var model = DataModelImpl()
    
    var body: some View {
        NavigationView {
            List {
                JustListenPlaybackView()
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                
                UpNextEpisodeListView()
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                
            }.padding([.leading, .trailing] ,15)
                .onAppear(perform: loadData)
            
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        
    }
    
    func loadData() {
        model.getEpisodeList(genreId: 140, page: 1)
        model.getListenPodCast()
    }
  
}
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
                .frame(maxWidth : .infinity, maxHeight: 150)
                .padding()
                .background(Color.init(UIColor.systemGray5))
                .cornerRadius(15)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
            
        }
    }
}

struct UpNextEpisodeListView: View {

    @FetchRequest(entity: Episode.entity(), sortDescriptors: [
             NSSortDescriptor(key: "id", ascending: true)
      ]) var episodeList : FetchedResults<Episode>

      @ObservedObject var model = DataModelImpl()
    
    var body: some View {
        Section(header: UpNextHeaderSection().background(Color(UIColor.white))) {
                NavigationLink(destination: ShowDetailView()) {
                    UpNextListView(episode: episodeList.first!)
                }
//            ForEach(episodeList, id : \.id, content: {
//                data in
//
//                NavigationLink(destination: ShowDetailView()) {
//                    UpNextListView(episode: data)
//                }
//            })
            
        
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
