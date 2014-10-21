//
//  User.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class User : NSObject, NSCoding
{
    var ID: String!
    var nickname: String!
    
    init(ID: String, nickname: String)
    {
        self.ID = ID
        self.nickname = nickname
    }
    
    required init(coder aDecoder: NSCoder)
    {
        self.ID = aDecoder.decodeObjectForKey("ID") as String
        self.nickname = aDecoder.decodeObjectForKey("nickname") as String
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.ID, forKey: "ID")
        aCoder.encodeObject(self.nickname, forKey: "nickname")
    }

}