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
    
    @State var isExistShow : Bool = false
    @State private var selectedTab = 0

    var body: some View {
        
//        let selection = Binding<Int>(
//            get: { self.selectedTab },
//            set: { self.selectedTab = $0
//                print("Pressed tab: \($0)")
//                if $0 == 2 {
//                    if self.isExistYourShows() {
//                        UserShowsView()
//                       
//                    }
//                }
//        })

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

            
            WelcomeSearchView()
            .tabItem {(
                VStack {
                    Image(systemName: "person.crop.square").font(.system(size: 24, weight: .regular))
                    //Text("User")
                    }

                )}
            .tag(3)
        }.accentColor(Color(UIColor.systemPink))
        
    }
    
    
    func isExistYourShows() -> Bool {
        
        let entity = String(describing: UserPodcast.self)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
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
