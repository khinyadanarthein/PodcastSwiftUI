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
    
    @FetchRequest(entity: ListenPodcast.entity(), sortDescriptors: [
           NSSortDescriptor(key: "id", ascending: true)
    ]) var justListen : FetchedResults<ListenPodcast>
    
    
    @FetchRequest(entity: Episode.entity(), sortDescriptors: [
           NSSortDescriptor(key: "id", ascending: true)
    ]) var episodeList : FetchedResults<Episode>
    
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: PodCastHeaderSection().background(Color(UIColor.white))) {
                   
                    MusicPlayerView(listenPod: model.justListenCast)
                        .cornerRadius(15)
                        .padding([.top, .bottom])
                    
                    AttributedText(model.justListenCast.castDescription ?? "")
                        .frame(maxWidth : .infinity, maxHeight: 100)
                        .padding()
                        .background(Color.init(UIColor.systemGray5))
                        .cornerRadius(15)
                        .lineLimit(6)
                        .multilineTextAlignment(.leading)
                    
                }.listRowInsets(EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: 0,
                    trailing: 0))
                
                Section(header: UpNextHeaderSection().background(Color(UIColor.white))) {
                    ForEach(episodeList, id : \.id, content: {
                        data in
                        
                        NavigationLink(destination: ShowDetailView(), label: {
                            UpNextListView(episode: data)
                            
                        })
                        
                        
                    })
                    
                }.listRowInsets(EdgeInsets(
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
