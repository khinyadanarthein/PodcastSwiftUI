//
//  Podcast+CoreDataProperties.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//
//

import Foundation
import CoreData


extension Podcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Podcast> {
        return NSFetchRequest<Podcast>(entityName: "Podcast")
    }

    @NSManaged public var id: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var listenNote: String?
    @NSManaged public var publisher: String?
    @NSManaged public var thumbail: String?
    @NSManaged public var title: String?
    @NSManaged public var episodes: Episode?

}
