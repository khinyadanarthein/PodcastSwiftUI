//
//  MainTabView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 26/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {(
                VStack {
                    Image(systemName: "equal.square")
                        .font(.system(size: 27, weight: .regular))
                    Text("home")
                }
                )}
            .tag(0)

            SearchShowsView()
            .tabItem {(
                VStack {
                    Image(systemName: "magnifyingglass").font(.system(size: 27, weight: .regular))
                    Text("search")
                    }

                )}
            .tag(1)

            UserShowsView()
            .tabItem {(
                VStack {
                    Image(systemName: "icloud.and.arrow.down").font(.system(size: 27, weight: .regular))
                    Text("cloud")
                    }

                )}
            .tag(2)
            
            ShowDetailView()
            .tabItem {(
                VStack {
                    Image(systemName: "person.crop.square").font(.system(size: 27, weight: .regular))
                    Text("User")
                    }

                )}
            .tag(2)
        }.accentColor(Color(UIColor.systemPink))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
