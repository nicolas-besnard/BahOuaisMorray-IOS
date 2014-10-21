//
//  FindContactService.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation
import Alamofire

typealias FindContactCompletionBlock = (user: User) -> Void

class FindContactService : Service
{
    func find(nickname: String, callback : FindContactCompletionBlock)
    {
        let endPoint = baseEndPoint + "/users/find"
        
        Router.Token = "050f4d379f544ed2ddda7abb"

        Alamofire.request(Router.FindUser(nickname))
            .responseJSON { (url, response, data, error) in
                if response?.statusCode >= 300
                {
                    self.handleError(url, response: response, data: data, error: error)
                }
                else
                {
                    println("OK")
                    println(data)
                    if let ok : AnyObject = data
                    {
                        let json = JSON(ok)
                        
                        let user = json["user"]
                        let newContact = User(ID: user["id"].stringValue, nickname: user["nickname"].stringValue)

                        callback(user: newContact)
                    }
                }
        }
    }
}
