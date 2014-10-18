//
//  Environment.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class Environment
{
    enum Type: Int
    {
        case PRODUCTION, DEVELOPMENT
    }
    
    var value : Type = .DEVELOPMENT
    
    init(setEnv env: Type)
    {
       self.value = env
    }
    
    func isProduction() -> Bool
    {
        return self.value == .PRODUCTION
    }
    
    func isDevelopment() -> Bool
    {
        return self.value == .DEVELOPMENT
    }
}