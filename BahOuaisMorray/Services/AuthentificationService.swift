//
//  LoginService.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation
import Alamofire

typealias AuthentificationSuccessCompletionBlock = () -> Void

class AuthentificationService : Service
{
    func login(nickname: String!, password: String!, pushToken: String!, callback: AuthentificationSuccessCompletionBlock)
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
                        Context.shared.currentUser.token = json["token"].stringValue

                        var contacts : [User] = []
                        
                        for user in json["contacts"].arrayValue
                        {
                            var newContact = User(ID: user["id"].stringValue, nickname: user["nickname"].stringValue)
                            contacts.append(newContact)
                        }
                        
                        Context.shared.currentUser.contacts = contacts
                        Context.shared.currentUser.saveContacts()
                        
                        callback()
                    }
                }
        }
    }
    
    func register(nickname: String!, password: String!, pushToken: String!, callback: AuthentificationSuccessCompletionBlock)
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
                    self.handleRegisterError(url, response: response, data: data, error: error)
                }
                else
                {
                    if let possibleJson: AnyObject = data
                    {
                        let json = JSON(possibleJson)
                        Context.shared.currentUser.token = json["token"].stringValue
                        callback()
                    }
                }
        }

    }
}