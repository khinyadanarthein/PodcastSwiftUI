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
        
        VStack(alignment: .leading) {
            HStack {
                Text("Up Next")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding([.leading, .trailing], 15)
            
            ForEach(episodeList, id : \.self, content: { data in
                NavigationLink(destination: ShowDetailView(detail: data), label: {
                    UpNextListView(episode: data)
                })
               // UpNextListView(episode: data)
            })
            
        }
    }
}


struct UpNextEpisodeListView_Preview : PreviewProvider {
    static var previews : some View {
        UpNextEpisodeListView()
    }
}
