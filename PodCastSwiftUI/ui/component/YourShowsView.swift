//
//  YourShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 28/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct YourShowsView: View {
    var body: some View {
        HStack {
                Image("podcast-hour")
                .resizable()
                .frame(width: 100, height: 150, alignment: .leading)
                .scaledToFit()
                .cornerRadius(20)
                
            VStack(alignment: .leading, spacing: 14){
                Text("Category")
                    .padding([.leading,.trailing])
                    .padding([.top, .bottom], 8)
                    .background(Color.pink)
                    .cornerRadius(15)
                Text("Woman n Techpost Host by Espree Devona")
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                
                Text("Woman n Techpost Host by Espree Devona")
                    .font(.system(size: 15, weight: .regular))
                    .lineLimit(1)
            }.frame(maxWidth : .infinity)
            
        }
    }
}

struct YourShowsView_Previews: PreviewProvider {
    static var previews: some View {
        YourShowsView()
    }
}
