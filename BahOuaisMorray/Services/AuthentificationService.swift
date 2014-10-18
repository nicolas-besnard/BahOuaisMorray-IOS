//
//  LoginService.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class AuthentificationService : Service
{
    func login(nickname: String!, password: String!, pushToken: String!)
    {
        let endPoint = baseEndPoint + "/users/login"
        let parameters = [
            "nickname": nickname,
            "password": password,
            "push_token": pushToken
        ]
        
        manager.POST(endPoint,
            parameters: parameters,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("success")
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("error")
            }
        )
    }
}