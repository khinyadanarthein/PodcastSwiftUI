//
//  MainTabView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 26/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import CoreData

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {(
                VStack {
                    Image(systemName: "equal.square")
                        .font(.system(size: 24, weight: .regular))
                    //Text("home")
                }
                )}
            .tag(0)

            SearchShowsView()
            .tabItem {(
                VStack {
                    Image(systemName: "magnifyingglass").font(.system(size: 24, weight: .regular))
                    //Text("search")
                    }

                )}
            .tag(1)

            if isExistYourShows() {
                UserShowsView()
                .tabItem {(
                    VStack {
                        Image(systemName: "icloud.and.arrow.down").font(.system(size: 24, weight: .regular))
                        //Text("cloud")
                        }

                    )}
                .tag(2)
                
            } else {
                WelcomeSearchView()
                .tabItem {(
                    VStack {
                        Image(systemName: "icloud.and.arrow.down").font(.system(size: 24, weight: .regular))
                        //Text("cloud")
                        }

                    )}
                .tag(2)
            }
            
            
            ShowDetailView()
            .tabItem {(
                VStack {
                    Image(systemName: "person.crop.square").font(.system(size: 24, weight: .regular))
                    //Text("User")
                    }

                )}
            .tag(2)
        }.accentColor(Color(UIColor.systemPink))
    }
    
    
    func isExistYourShows() -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Episode")
        //fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: [id])

        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
