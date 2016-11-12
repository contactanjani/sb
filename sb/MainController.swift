//
//  MainController.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation

private let _sharedInstance = MainController()


/*
 This class takes the request from view and fetches data from product Service
 */

class MainController
{
    init()
    {
        
    }
    
    class var sharedInstance : MainController
    {
        return _sharedInstance
    }
    
    
    func getProductData(completionHandler: @escaping ([Product]?) -> Swift.Void)
    {
        ProductService.sharedInstance.getData(completionHandler: { (list) in
                    
            completionHandler(list)
        })
                
        
    }
}
