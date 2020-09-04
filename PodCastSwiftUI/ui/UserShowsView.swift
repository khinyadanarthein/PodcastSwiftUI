//
//  UserShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI

struct UserShowsView: View {
    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<25, content: {
                    data in
                    
                    YourShowsView()
                })
                    .navigationBarItems(leading: Text("Your Shows").font(Font.system(size: 28).bold()), trailing: Image(systemName: "ellipsis").font(.system(size: 16, weight: .regular)))
            }
        }
        
    }
}

struct UserShowsView_Previews: PreviewProvider {
    static var previews: some View {
        UserShowsView()
    }
}

struct YourShowsList: View {
    var body: some View {
        List {
            Section(header: YourShowHeaderSection().padding()
                .background(Color(UIColor.white))) {
                    ForEach(0..<25, content: {
                        data in
                        
                        YourShowsView()
                            .padding()
                    })
                    
            }.listRowInsets(EdgeInsets(
                top: 0,
                leading: 0,
                bottom: 0,
                trailing: 0))
        }
    }
}
