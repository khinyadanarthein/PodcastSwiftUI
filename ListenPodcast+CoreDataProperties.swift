//
//  ListenPodcast+CoreDataProperties.swift
//  
//
//  Created by Thet Htun on 9/6/20.
//
//

import Foundation
import CoreData


extension ListenPodcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListenPodcast> {
        return NSFetchRequest<ListenPodcast>(entityName: "ListenPodcast")
    }

    @NSManaged public var audioLength: Int64
    @NSManaged public var audioUrl: String?
    @NSManaged public var castDescription: String?
    @NSManaged public var id: String?
    @NSManaged public var link: String?
    @NSManaged public var listennoteUrl: String?
    @NSManaged public var publishDate: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?

}
