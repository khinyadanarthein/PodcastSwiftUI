//
//  UpNextEpisodeListView.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct UpNextEpisodeListView: View {
    
    @FetchRequest(entity: Episode.entity(), sortDescriptors: [
        NSSortDescriptor(key: "id", ascending: true)
    ]) var episodeList : FetchedResults<Episode>
    
    
    var body: some View {
        Section(header: UpNextHeaderSection().background(Color(UIColor.white))) {
            ForEach(episodeList, id : \.id, content: {
                data in
                
                NavigationLink(destination: ShowDetailView(), label: {
                    UpNextListView(episode: data)
                    
                })
                
                
            })
            
        }
    }
}

