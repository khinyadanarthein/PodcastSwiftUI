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
    
    @State var genreList = [GenreVO]()
    
    @FetchRequest(entity: Genre.entity(), sortDescriptors: [
           NSSortDescriptor(key: "name", ascending: true)
    ]) var genrelist : FetchedResults<Genre>
    
    let model = DataModelImpl.shared
    
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
//                        ForEach(0..<5, content: { _ in
//                            CategoryView(genreName: "Genre")
//                        }).frame(maxWidth: .infinity)
                    //}
                    
                }.padding()
                
            }
        }.onAppear(perform: loadGenre)
    }
    
    func loadGenre() {
        model.getGenreList(success: { (datalist) in
            
            //self.genreList = datalist
            let genres = [GenreVO(id: 1, name: "Tech", parentID: 1), GenreVO(id: 2, name: "IT", parentID: 2)]
            
            for data in genres {
                let genre = Genre(context :context)
                genre.id = Int64(data.id)
                genre.name = data.name
                genre.parentId = Int64(data.parentID ?? 0)
            }
            
            do {
                try context.save()
            
            } catch {
                print("fail to save")
            }
            
        }) { (error) in
            let genres = [GenreVO(id: 1, name: "Tech", parentID: 1), GenreVO(id: 2, name: "IT", parentID: 2),GenreVO(id: 3, name: "IT", parentID: 2)]
                       
            for data in genres {
                
               if !self.isExist(id: data.id) {
                    let genre = Genre(context :context)
                    genre.id = Int64(data.id)
                    genre.name = data.name
                    genre.parentId = Int64(data.parentID ?? 0)
                }
            }
            
            do {
                try context.save()
                
            } catch {
                print("fail to save")
            }
            
        }
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
            .padding([.leading,.trailing])
            .padding([.top, .bottom], 8)
                .background(Color.random)
            .cornerRadius(15)
        }
        
    }
}
