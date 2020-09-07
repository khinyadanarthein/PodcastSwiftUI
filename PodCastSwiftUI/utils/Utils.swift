//
//  Utils.swift
//  PodCastSwiftUI
//
//  Created by Khin Yadanar Thein on 05/09/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import Foundation
import CoreData

class Utils {
    
    static let shared : Utils = Utils()
    
    private init() {}
    
    func secondsToHoursMinutes (seconds : Int) -> (String) {
        return ("\(seconds / 3600)hr \(seconds % 60)min")
    }
    
    func isExist(id : String, entity : String) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: [id])
        
        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
    
    
    func isExistAll(entity : String) -> Bool {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        //fetchRequest.predicate = NSPredicate(format: "id = %d", argumentArray: [id])
        
        let res = try! context.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}
