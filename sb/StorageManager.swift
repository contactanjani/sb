//
//  StorageManager.swift
//  sb
//
//  Created by Anjani on 11/12/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation
import UIKit
import CoreData

private let _sharedInstance = StorageManager()
class StorageManager
{
    init()
    {
        
    }
    
    class var sharedInstance : StorageManager
    {
        return _sharedInstance
    }
    
    func save(productList : [Product]) {

        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: kEntityName, in:managedContext)
        for product in productList
        {
            let productObject = NSManagedObject(entity: entity!, insertInto: managedContext)
            productObject.setValue(product.title, forKey: "title")
            productObject.setValue(product.description, forKey: "desc")
            productObject.setValue(product.imgUrl, forKey: "imgurl")
            productObject.setValue(product.displayPrice, forKey: "price")
            
            do {
                try managedContext.save()
                print("successfully saved into core data")
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchProducts(completion : (([Product]) -> Swift.Void)? = nil)
    {
        var reminderList = [Product]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: kEntityName)
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            let rawList = results as! [NSManagedObject]
            for obj in rawList {
                let reminder = Product(dictionary : obj)
                reminderList.append(reminder)
            }
            
            print("successful fetch")
            completion?(reminderList)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            completion?(reminderList)
        }
    }
}
