//
//  Router.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible
{
    static let baseURLString = "http://localhost:3000"
    static var Token: String?
    
    case FindUser(String)
    
    var method: Alamofire.Method {
        switch self {
        case .FindUser:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .FindUser:
            return "/users/find"
        default:
            return "/"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest
    {
        let URL = NSURL(string: Router.baseURLString)!
    
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = Router.Token
        {
            mutableURLRequest.setValue("Token token=\(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .FindUser(let nickname):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: ["nickname" : nickname]).0
        default:
            return mutableURLRequest
        }
    }
}