//
//  FormValidator.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import Foundation

class FormValidator
{
    var params : [String : [String : NSObject]]!
    
    init(params : [String : [String : NSObject]])
    {
        self.params = params
    }
    
    func isValid() -> Bool
    {
        let alert = UIAlertView(title: "Tu t'es trompé Morray !", message: "", delegate: nil, cancelButtonTitle: "OK")
        
        if let pseudo = params["pseudo"]
        {
            let realPseudo = pseudo["value"]! as String

            let pseudoLen = countElements(realPseudo)

            if !(pseudoLen >= 4 && pseudoLen < 25)
            {
                (pseudo["field"] as UITextField).becomeFirstResponder()
                
                alert.message = "Ton pseudo a besoin de 4 caractères minimum."
                alert.show()
                
                return false
            }
        }
        
        if let password = params["password"]
        {
            let realPassword = password["value"]! as String
            
            if !confirmPasswordLength(realPassword)
            {
                (password["field"] as UITextField).becomeFirstResponder()
                
                alert.message = "Ton mot de passe a besoin de 4 caractères minimum."
                alert.show()
                
                return false
            }
        }
            
        if let confirmation = params["confirmation"]
        {
            let realConfirmation = confirmation["value"]! as String
            
            if !confirmPasswordLength(realConfirmation) || realConfirmation != params["password"]!["value"]
            {
                (confirmation["field"] as UITextField).becomeFirstResponder()
                
                alert.message = "La confirmation du mot de passe n'est pas bonne."
                alert.show()
                
                return false
            }
        }
        
        return true
    }
    
    private func confirmPasswordLength(password : String!) -> Bool
    {
        let passwordLen = countElements(password)
    
        if !(passwordLen >= 4 && passwordLen < 99)
        {
            return false
        }
        return true
    }
}