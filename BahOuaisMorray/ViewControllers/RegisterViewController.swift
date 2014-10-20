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
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationTextField: UITextField!
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nicknameTextField.delegate     = self
        passwordTextField.delegate     = self
        confirmationTextField.delegate = self
        
        nicknameTextField.becomeFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clearForm:", name: "ClearFormNotification", object: nil)
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ClearFormNotification", object: nil)
    }
    
    func clearForm(notification: NSNotification)
    {
        nicknameTextField.text = ""
        passwordTextField.text = ""
        confirmationTextField.text = ""
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
        let nickname = nicknameTextField.text
        let password = passwordTextField.text
        let confirmation = confirmationTextField.text
        
        let params = [
            "nickname": [
                "field": nicknameTextField,
                "value": nickname
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
            Context.shared.authentificationService.register(nickname, password: password, pushToken: "caca", callback: {
                println("SHOW HOME ")
                self.navigationController?.performSegueWithIdentifier("ShowHome", sender: nil)
            })
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
