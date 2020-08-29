//
//  SearchShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct SearchShowsView: View {
    
    var body: some View {
        ScrollView {
            Image("podcast-space")
            .resizable()
            .frame(height : 400)
            .scaledToFit()
            .cornerRadius(30)
                .padding([.leading, .trailing], 30)
            
           Text("Categories")
            .frame(maxWidth : .infinity, alignment: .leading)
            .padding([.top, .leading], 30)
            .font(Font.system(size: 27).bold())
            
            ScrollView(.horizontal) {
                
                HStack (spacing : 10) {
                    
                    ForEach(1..<5) { _ in
                        CategoryView()
                    }
                    
                }.padding()
                
            }
        }
    }
}

struct SearchShowsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchShowsView()
    }
}

struct CategoryView: View {
    var body: some View {
        Image("podcast-grown")
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(width: 150, height: 150, alignment: .leading)
    }
}
