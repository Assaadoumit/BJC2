//
//  CoreDataFile.swift
//  BJC
//
//  Created by MacBookPro on 12/19/18.
//  Copyright © 2018 MacBookPro. All rights reserved.
//

import CoreData
import UIKit

class CoreData: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(highScore:String) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "score", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(highScore, forKey: highScore)
        
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func fetchObject() -> Score? {
        let context = getContext()
        var highScore: Score? = nil
        
        do {
            highScore = try context.fetch(Score.fetchRequest())
            return Score
        } catch {
            return Score
        }
    }
    
}

