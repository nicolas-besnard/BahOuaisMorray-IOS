//
//  LoginService.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation
import Alamofire

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
        
        Alamofire.request(.POST, endPoint, parameters: parameters)
            .responseJSON { (url, response, data, error) in
                if response?.statusCode >= 300
                {
                    self.handleError(url, response: response, data: data, error: error)
                }
                else
                {
                    if let possibleJson: AnyObject = data
                    {
                        let json = JSON(possibleJson)
                        println("Token " + json["token"].stringValue)
                    }
                }
        }
    }
    
    func register(nickname: String!, password: String!, pushToken: String!)
    {
        let endPoint = baseEndPoint + "/users/register"
        
        let parameters = [
            "nickname": nickname,
            "password": password,
            "push_token": pushToken
        ]

        Alamofire.request(.POST, endPoint, parameters: parameters)
            .responseJSON { (url, response, data, error) in
                if response?.statusCode >= 300
                {
                    self.handleError(url, response: response, data: data, error: error)
                }
                else
                {
                    if let possibleJson: AnyObject = data
                    {
                        let json = JSON(possibleJson)
                        println("Token" + json["token"].stringValue)
                    }
                }
        }

    }
}