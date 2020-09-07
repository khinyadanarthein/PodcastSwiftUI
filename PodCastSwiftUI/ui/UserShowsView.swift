//
//  UserShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import CoreData

struct UserShowsView: View {

    @FetchRequest(entity: UserPodcast.entity(), sortDescriptors: [
        NSSortDescriptor(key: "id", ascending: true)
    ]) var userCastList : FetchedResults<UserPodcast>
    
    @State var hasDownloadList : Bool = false
    
    var body: some View {
        
        NavigationView {
            MainDownloadView()
            
        }
        
    }
}

struct UserShowsView_Previews: PreviewProvider {
    static var previews: some View {
        UserShowsView()
    }
}


struct DownloadListView: View {
    
    @State var userCastList : FetchedResults<UserPodcast>
    
    var body: some View {
        ForEach(userCastList, id: \.self, content: {
            data in
            NavigationLink(destination: UserShowDetailView(detail: data)) {
                YourShowsView(userCast: data)
            }
            
        })
            .navigationBarItems(leading: Text("Your Shows").font(Font.system(size: 28).bold()), trailing: Image(systemName: "ellipsis").font(.system(size: 16, weight: .regular)))
    }
}

struct MainDownloadView: View {
    
    @FetchRequest(entity: UserPodcast.entity(), sortDescriptors: [
        NSSortDescriptor(key: "id", ascending: true)
    ]) var userCastList : FetchedResults<UserPodcast>
    
    var body: some View {
        ScrollView {
            if !Utils.shared.isExistAll(entity: "UserPodcast") {
                WelcomeSearchView()
                
            } else {
                DownloadListView(userCastList: userCastList)
                
            }
        }.padding([.leading,.trailing])
    }
}
