//
//  CurrentUser.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class CurrentUser
{
    var ID : String!
    {
        get
        {
            if let ID: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("currentUserID") {
                return ID as String!
            }
            return nil
        }
        set
        {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "currentUserID")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var token : String!
    {
        get
        {
            if let token: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("currentUserToken") {
                return token as String!
            }
            return nil
        }
        set
        {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "currentUserToken")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}