//
//  ProductService.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation

/*
 This class is responsible for taking the request from VIEW and checking if the data exists locally or not. Fetches it from api, if the data is not available locally. Makes a call to Storage Manager or API manager depending on situation. After API call, it saves all the data locally.
 */
private let _sharedInstance = ProductService()
class ProductService
{
    
    class var sharedInstance : ProductService
    {
        return _sharedInstance
    }
    
    init()
    {
        
    }
    
    func getData(completionHandler: @escaping ([Product]?) -> Swift.Void)
    {
        StorageManager.sharedInstance.fetchProducts(completion: { (list) in
            if list.count > 0
            {
                completionHandler(list)
                
            }else
            {
                let url = URL(string : kHomeUrl)
                let request = URLRequest(url: url!)
                
                APIManager.sharedInstance.initiateCall(request: request) { (data) in
                    guard (data != nil) else
                    {
                        completionHandler(nil)
                        return
                    }
                    do
                    {
                        let rawDictionary : [String : AnyObject]?  = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? [String : AnyObject]
                        var productList = [Product]()
                        if let rawProductList = rawDictionary?["produts"] as? [[String : AnyObject]]
                        {
                            for obj in rawProductList
                            {
                                let product = Product(dictionary: obj)
                                productList.append(product)
                            }
                        }
                        StorageManager.sharedInstance.save(productList: productList)
                        completionHandler(productList)
                    }
                    catch{
                        completionHandler(nil)
                    }
                }
            }
        })
    }
}
