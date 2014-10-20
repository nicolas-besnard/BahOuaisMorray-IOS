//
//  FindContactService.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation
import Alamofire

class FindContactService : Service
{
    func find(nickname: String)
    {
        let endPoint = baseEndPoint + "/users/find"
        
        let parameters = [
            "nickname": nickname,
        ]
        
        Alamofire.request(.GET, endPoint, parameters: parameters)
            .responseJSON { (url, response, data, error) in
                if response?.statusCode >= 300
                {
                    self.handleError(url, response: response, data: data, error: error)
                }
                else
                {
                    println("OK")
                    println(data)
                }
                
        }
    }
}
