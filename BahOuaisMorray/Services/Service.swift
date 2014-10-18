//
//  Service.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class Service
{
    let manager = AFHTTPRequestOperationManager()
    
    var baseEndPoint: String!
    
    init()
    {
        manager.securityPolicy.allowInvalidCertificates = true
        
        let jsonSerializer = AFJSONRequestSerializer()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        if Context.shared.env.isDevelopment()
        {
            baseEndPoint = "http://localhost:3000"
        }
        else
        {
            baseEndPoint = ""
        }
    }
    
    func handleError(operation: AFHTTPRequestOperation!, error: NSError!)
    {
        println("fail")
        println(operation.response)
    }
}