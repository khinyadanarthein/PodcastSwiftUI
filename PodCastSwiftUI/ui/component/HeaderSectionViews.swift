//
//  HeaderSectionViews.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 28/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct HeaderSectionViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HeaderSectionViews_Previews: PreviewProvider {
    static var previews: some View {
        YourShowHeaderSection()
    }
}

struct YourShowHeaderSection: View {
    var body: some View {
        HStack {
            Text("Your Shows")
                .font(.system(size: 27, weight: .bold))
                .frame(maxWidth : .infinity, alignment: .leading)
            Image(systemName: "ellipsis").font(.system(size: 16, weight: .regular))
        }.frame(maxWidth : .infinity, maxHeight: 60)
        .scaledToFill()
        .background(Color.white)
    }
}

struct UpNextHeaderSection: View {
    var body: some View {
        HStack {
            Text("Up Next")
                .font(.system(size: 27, weight: .bold))
                .frame(maxWidth : .infinity, alignment: .leading)
            Image(systemName: "ellipsis").font(.system(size: 16, weight: .regular))
        }.frame(maxWidth : .infinity, maxHeight: 60)
        .scaledToFill()
        .background(Color.white)
    }
}

struct PodCastHeaderSection: View {
    var body: some View {
        HStack {
            Image(systemName: "waveform").font(.system(size: 30, weight: .regular))
            Text("PodCast")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth : .infinity, alignment: .leading)
            
            ZStack {
                Circle()
                .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color(UIColor.lightText))
                Image(systemName: "bell").font(.system(size: 20, weight: .regular))
            }
            
            
        }.frame(maxWidth : .infinity, maxHeight: 60)
        .scaledToFill()
    }
}
