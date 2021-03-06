//
//  Episode+CoreDataProperties.swift
//  PodCastSwiftUI
//
//  Created by Thet Htun on 9/6/20.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//
//

import Foundation
import CoreData


extension Episode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Episode> {
        return NSFetchRequest<Episode>(entityName: "Episode")
    }

    @NSManaged public var audioLengthSec: Int64
    @NSManaged public var audioUrl: String?
    @NSManaged public var episodeDescription: String?
    @NSManaged public var id: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var link: String?
    @NSManaged public var title: String?
    @NSManaged public var episode_podcast: Podcast?

}
