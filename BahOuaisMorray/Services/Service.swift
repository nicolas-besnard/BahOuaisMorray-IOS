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
    }
}