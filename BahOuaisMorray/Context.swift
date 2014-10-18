//
//  Context.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class Context
{
    class var shared : Context
    {
        
        struct Static
        {
            static let instance : Context = Context()
        }
        
        return Static.instance
    }
}