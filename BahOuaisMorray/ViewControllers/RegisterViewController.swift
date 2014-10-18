//
//  RegisterViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationTextField: UITextField!
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pseudoTextField.delegate       = self
        passwordTextField.delegate     = self
        confirmationTextField.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == pseudoTextField)
        {
            pseudoTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else if (textField == passwordTextField)
        {
            passwordTextField.resignFirstResponder()
            confirmationTextField.becomeFirstResponder()
        }
        else if (textField == confirmationTextField)
        {
            checkForm()
        }
        return true
    }
    
    private func checkForm()
    {
        let pseudo = pseudoTextField.text
        let password = passwordTextField.text
        let confirmation = confirmationTextField.text
        
        let params = [
            "pseudo": [
                "field": pseudoTextField,
                "value": pseudo
            ],
            "password": [
                "field": passwordTextField,
                "value": password
            ],
            "confirmation": [
                "field": confirmationTextField,
                "value": confirmation
            ]
        ]
        
        let formValidation = FormValidator(params: params)
        
        if formValidation.isValid()
        {
            println("VALID")
        }
        else
        {
            println("NOT VALID")
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
