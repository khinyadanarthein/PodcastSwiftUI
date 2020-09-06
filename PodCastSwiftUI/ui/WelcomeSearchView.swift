//
//  WelcomeSearchView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 28/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import CoreData

struct WelcomeSearchView: View {
    
    @State var isExistShows : Bool = false
    
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
                    self.isExistShows = self.isExistYourShows()
                    
                }, label: {
                    Text("Reload")
                }).sheet(isPresented: $isExistShows, content: {
                    UserShowsView()
                })
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 60, alignment: .center)
                    .background(Color(UIColor(named: "light-yellow")!))
                    .foregroundColor(Color.black)
                    .cornerRadius(15)
            }
            
        }.padding([.leading, .trailing])
    }
    
    func isExistYourShows() -> Bool {
        
        let entity = String(describing: UserPodcast.self)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        //fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: [id])

        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}

struct WelcomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSearchView()
    }
}
