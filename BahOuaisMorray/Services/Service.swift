//
//  Service.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

import Alamofire

class Service
{
    var baseEndPoint: String!
    
    init()
    {
        if Context.shared.env.isDevelopment()
        {
            baseEndPoint = "http://localhost:3000"
        }
        else
        {
            baseEndPoint = ""
        }
    }
    
    func handleError(url: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?)
    {
        println("fail")
        println(data)
        if let errors: AnyObject = data
        {
            let json = JSON(errors)
            let msg = json["msg"].stringValue
            var error = ""
            
            showAlert(NSLocalizedString(msg, comment: ""))
        }
    }
    
    func handleRegisterError(url: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?)
    {
        if let errors: AnyObject = data
        {
            let json = JSON(errors)
            let errorField = json["field"].string!
            let errorType = json["error"].string!
            
            showAlert("\(errorField) \(errorType)")
            
            NSNotificationCenter.defaultCenter().postNotificationName("ClearFormNotification", object: nil)
        }
    }
    
    private func showAlert(message: String!)
    {
        let alert = UIAlertView(title: "Morray ! Il y a un truc qui va pas !", message: message, delegate: nil, cancelButtonTitle: "Ok")
        
        alert.show();
    }
}