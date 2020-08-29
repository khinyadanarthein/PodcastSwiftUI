//
//  HomeView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeView: View {
    var body: some View {
        
        List {
            Section(header: PodCastHeaderSection().background(Color(UIColor.white))) {
                Image("spotless-podcast-banner")
                .resizable()
                .frame(height : 200)
                .scaledToFit()
                .padding([.leading, .trailing] ,5)
            
                Text("At this point, I gave up trying to get TabView to behave like I wanted it to, considering the lack of documentation for TabView, and decided to directly use UITabBarController and embed it in SwiftUI.")
                    .padding()
                    .background(Color.init(UIColor.systemGray5))
                    .cornerRadius(15)
                    .multilineTextAlignment(.leading)
            }
            Section(header: UpNextHeaderSection().background(Color(UIColor.white))) {
                ForEach(0..<25, content: {
                    data in
                    
                    UpNextListView()
                })
            }
        }
    }
}

