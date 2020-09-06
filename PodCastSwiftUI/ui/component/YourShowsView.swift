//
//  YourShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 28/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct YourShowsView: View {
    
    var userCast : UserPodcast
    
    var body: some View {
        HStack {
            ImageFromUrlView(withURL: userCast.imageUrl ?? "")
//                Image("podcast-hour")
//                .resizable()
//                .frame(width: 110, height: 150, alignment: .leading)
//                .scaledToFit()
//                .cornerRadius(20)
                
            VStack(alignment: .leading, spacing: 14){
                Text("Web Design")
                    .padding([.leading,.trailing])
                    .padding([.top, .bottom], 8)
                    .background(Color.random)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                
                Text(userCast.title ?? "")
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                    .foregroundColor(.black)
                
                AttributedText(userCast.title ?? "")
                    .font(.system(size: 15, weight: .regular))
                    .lineLimit(1)
                    .foregroundColor(.black)
            }.frame(maxWidth : .infinity)
        }
    }
}

struct YourShowsView_Previews: PreviewProvider {
    static var previews: some View {
        YourShowsView(userCast: UserPodcast(context: context))
    }
}

extension Color {
    static var random : Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0.7...0.8),
            blue: .random(in: 0.8...0.9))
    }
}
