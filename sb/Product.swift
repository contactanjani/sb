//
//  Productt.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//
import Foundation
import CoreData

/*
 This class is the main Model class. Holds all the data related to Product.
 */

class Product
{
    var title : String?
    var imgUrl : String?
    var displayPrice : String?
    var description : String?
    
    init()
    {
        
    }
    
    init(dictionary : Dictionary<String,AnyObject?>)
    {
        if let in_title  = dictionary[kTitleKey] as? String
        {
           title = in_title
        }
    
        if let in_imgUrl = dictionary[kImageUrlKey] as? String {
            imgUrl = in_imgUrl.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        }
        
        if let in_displayPrice = dictionary[kPriceKey] as? String {
            displayPrice = in_displayPrice
        }
        
        if let in_description = dictionary[kDescriptionKey] as? String {
            description = in_description
        }
    }
    
    init(dictionary : NSManagedObject){
        
        if let in_title  = dictionary.value(forKey:"title") as? String
        {
            title = in_title
        }
        
        if let in_imgUrl = dictionary.value(forKey:"imgurl") as? String {
            imgUrl = in_imgUrl
        }
        
        if let in_displayPrice = dictionary.value(forKey:"price") as? String {
            displayPrice = in_displayPrice
        }
        
        if let in_description = dictionary.value(forKey:"desc") as? String {
            description = in_description
        }
    }

}
