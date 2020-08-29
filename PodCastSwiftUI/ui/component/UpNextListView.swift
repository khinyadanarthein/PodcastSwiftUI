//
//  UpNextListView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 27/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct UpNextListView: View {
    
    @State var value : CGFloat = 0
    	
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
                    .background(Color.pink)
                    .cornerRadius(15)
                Text("Woman n Techpost Host by Espree Devona")
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                
                ProgressView(color: .red, completionPercentage: $value)
                .frame(height: 7)
                
            }.frame(maxWidth : .infinity, maxHeight: .infinity)
            
//            Image(systemName: "icloud.and.arrow.down")
//            .resizable()
//            .frame(width: 40, height: 30, alignment: .center)
//            .scaledToFit()
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
