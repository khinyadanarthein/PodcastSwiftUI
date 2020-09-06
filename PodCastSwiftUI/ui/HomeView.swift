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
    
    init() {
        //To hide List scrollbars & seperator
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().separatorStyle = .none
    }
    
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
                
            }
            .padding([.leading, .trailing] ,15)
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
