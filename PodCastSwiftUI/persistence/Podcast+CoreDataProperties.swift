//
//  Podcast+CoreDataProperties.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 06/09/2020.
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

}
