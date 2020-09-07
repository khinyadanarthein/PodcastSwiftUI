//
//  SearchShowsView.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 23/08/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import SwiftUI
import CoreData

struct SearchShowsView: View {
    
    //@State var genreList = [GenreVO]()
    
    @FetchRequest(entity: Genre.entity(), sortDescriptors: [
           NSSortDescriptor(key: "name", ascending: true)
    ]) var genrelist : FetchedResults<Genre>
    
    let model = DataModelImpl()
    
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
                    //List{
                        ForEach(genrelist, id: \.id, content: { data in
                            CategoryView(genreName: data.name ?? "")
                        }).frame(maxWidth: .infinity)

                }.padding()
                .frame(maxHeight : 200)
                
            }
        }.onAppear(perform: loadGenre)
    }
    
    func loadGenre() {
        model.getGenreList()
    }
    
    func isExist(id : Int) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Genre")
        fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: [id])

        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}

struct SearchShowsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchShowsView()
    }
}

struct CategoryView: View {
    
    var genreName : String
    
    var body: some View {
        VStack {
            Image("podcast-grown")
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(width: 150, height: 150, alignment: .leading)
            
            Text(genreName)
                .font(Font.system(size: 12).bold())
            .padding([.leading,.trailing])
            .padding([.top, .bottom], 8)
                .background(Color.random)
            .cornerRadius(15)
        }
        
    }
}
