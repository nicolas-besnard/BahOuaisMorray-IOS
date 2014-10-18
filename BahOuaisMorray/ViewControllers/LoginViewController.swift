//
//  LoginViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nicknameTextField.delegate = self
        passwordTextField.delegate = self
        
        nicknameTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == nicknameTextField)
        {
            nicknameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else if (textField == passwordTextField)
        {
            checkForm()
        }

        return true
    }
    
    private func checkForm()
    {
        let nickname = nicknameTextField.text
        let password = passwordTextField.text
        
        let params = [
            "nickname": [
                "field": nicknameTextField,
                "value": nickname
            ],
            "password": [
                "field": passwordTextField,
                "value": password
            ],
        ]
        
        let formValidation = FormValidator(params: params)
        
        if formValidation.isValid()
        {
            println("VALID")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
