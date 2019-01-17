//
//  Score+CoreDataProperties.swift
//  
//
//  Created by MacBookPro on 12/18/18.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var score: String?

    
}
