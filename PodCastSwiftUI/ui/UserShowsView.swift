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
        List {
            
            Section(header: YourShowHeaderSection().background(Color(UIColor.white))) {
                ForEach(0..<25, content: {
                    data in
                    
                    YourShowsView()
                })
            }
        }
    }
}

struct UserShowsView_Previews: PreviewProvider {
    static var previews: some View {
        UserShowsView()
    }
}
