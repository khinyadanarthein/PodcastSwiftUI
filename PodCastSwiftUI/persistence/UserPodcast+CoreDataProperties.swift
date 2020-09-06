//
//  UserPodcast+CoreDataProperties.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 06/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//
//

import Foundation
import CoreData


extension UserPodcast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPodcast> {
        return NSFetchRequest<UserPodcast>(entityName: "UserPodcast")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var castDescription: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var audioUrl: String?
    @NSManaged public var audioLength: Int64

}
