//
//  UpNextListView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 27/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct UpNextListView: View {
    
    @State var value : CGFloat = 10
    	
    var body: some View {
       HStack {
            Image("Podcast-Cover-artist")
            .resizable()
            .frame(width: 100, height: 150, alignment: .leading)
            .scaledToFit()
            .cornerRadius(20)
                .padding([.top, .bottom])
            
        HStack {
            VStack(alignment: .leading, spacing: 15){
                Text("Category")
                    .padding([.leading,.trailing])
                    .padding([.top, .bottom], 8)
                    .background(Color(UIColor(named: "sky-blue")!))
                    .cornerRadius(15)
                Text("Woman n Techpost Host by Espree Devona")
                    .font(.system(size: 15, weight: .bold))
                    .lineLimit(2)
               
                HStack {
                    ProgressView(color : UIColor(named: "sky-blue")!, completionPercentage: $value)
                                   .frame(height: 7)
                    
                    Text("1hr left").font(.system(size: 13))
                }.frame(maxWidth: .infinity)
               
                
            }.frame(maxWidth : .infinity, maxHeight: .infinity)
           
                Image(systemName: "icloud.and.arrow.down").font(.system(size: 25, weight: .regular))
                .foregroundColor(Color.pink)
        }
           
        }
    }
}

struct UpNextListView_Previews: PreviewProvider {
    static var previews: some View {
        UpNextListView()
    }
}
