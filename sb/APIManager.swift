//
//  APIManager.swift
//  sb
//
//  Created by Anjani on 11/11/16.
//  Copyright © 2016 do. All rights reserved.
//

import Foundation

/*
 This class initiates API call to server for the request received from service layer and gives the data back to service layer. This class adds all the request to a list and utility methods to delete a request while it's in progress.
 */

private let _sharedInstance = APIManager()

class APIManager
{
    var requestQueue : [URLRequest]?
    init()
    {
        
    }
    
    class var sharedInstance : APIManager
    {
        return _sharedInstance
    }
    
    private func addRequestToQueue(request : URLRequest){
        
        if requestQueue == nil
        {
            requestQueue = [URLRequest]()
        }
        requestQueue?.append(request)
    }
    
    func removeRequestFromQueue(url : String?)
    {
       //code to delete request from queue if required
    }
    
    func initiateCall(request : URLRequest, completionHandler: @escaping (Data?) -> Swift.Void ){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else
            {
                completionHandler(nil)
                return
            }
            guard data != nil else
            {
                completionHandler(nil)
                return
            }
            completionHandler(data)
            
        }.resume()
    }
}
