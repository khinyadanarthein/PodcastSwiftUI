//
//  HomeView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var castDescription = "At this point, I gave up trying to get TabView to behave like I wanted it to, considering the lack of documentation for TabView, and decided to directly use UITabBarController and embed it in SwiftUI."
    
    var body: some View {
        
        NavigationView {
            List {
                        Section(header: PodCastHeaderSection().background(Color(UIColor.white))) {
                            
            //                Image("spotless-podcast-banner")
            //                .resizable()
            //                .frame(height : 200)
            //                .scaledToFit()
                            
                            MusicPlayerView()
                                .cornerRadius(15)
                                .padding([.top, .bottom])
                        
                            Text(castDescription)
                                .padding()
                                .background(Color.init(UIColor.systemGray5))
                                .cornerRadius(15)
                                .multilineTextAlignment(.leading)
                        
                        }.listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                        
                        Section(header: UpNextHeaderSection().background(Color(UIColor.white))) {
                            ForEach(0..<25, content: {
                                data in
                                
                                NavigationLink(destination: ShowDetailView(), label: {
                                    UpNextListView()
                                    
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
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
