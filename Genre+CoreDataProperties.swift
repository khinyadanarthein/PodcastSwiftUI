//
//  Genre+CoreDataProperties.swift
//  
//
//  Created by Thet Htun on 9/6/20.
//
//

import Foundation
import CoreData


extension Genre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Genre> {
        return NSFetchRequest<Genre>(entityName: "Genre")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var parentId: Int64

}
