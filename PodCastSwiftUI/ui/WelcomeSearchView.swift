//
//  WelcomeSearchView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 28/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct WelcomeSearchView: View {
    var body: some View {
        ScrollView {
            Image("podcast-space")
                .resizable()
                .frame(height : 300)
                .scaledToFit()
                .cornerRadius(30)
                .padding([.leading, .trailing], 60)
            Text("Welcome")
            .frame(maxWidth : .infinity, alignment: .center)
            .padding(30)
            .font(Font.system(size: 27).bold())
            
            Text("It looks like you aren't enrolled in any podcasts, but it's easy to get start.")
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading], 80)
                .padding([.bottom], 30)
                .font(Font.system(size: 15).bold())
            
            VStack(spacing : 10) {
                Button(action: {
                    
                    print("Clicked")
                    
                }, label: {
                    Text("Find Something New")
                })
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                    .background(Color(UIColor(named: "sky-blue")!))
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
                
                Button(action: {
                    
                    print("Clicked")
                    
                }, label: {
                    Text("Reload")
                })
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                    .background(Color(UIColor(named: "light-yellow")!))
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
            }
            
        }.padding([.leading, .trailing])
    }
}

struct WelcomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSearchView()
    }
}
