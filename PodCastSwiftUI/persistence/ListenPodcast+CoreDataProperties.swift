//
//  ListenPodcast+CoreDataProperties.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 05/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//
//

import Foundation
import CoreData


extension ListenPodcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListenPodcast> {
        return NSFetchRequest<ListenPodcast>(entityName: "ListenPodcast")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var castDescription: String?
    @NSManaged public var audioUrl: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var publishDate: String?
    @NSManaged public var listennoteUrl: String?
    @NSManaged public var audioLength: Int64
    @NSManaged public var link: String?

}
