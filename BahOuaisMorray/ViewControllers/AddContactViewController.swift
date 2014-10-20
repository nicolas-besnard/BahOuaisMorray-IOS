//
//  AddContactViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nicknameTextField.delegate = self
        
        nicknameTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        checkForm()
        
        return true
    }
    
    private func checkForm()
    {
        let nickname = nicknameTextField.text
        
        let params = [
            "nickname": [
                "field": nicknameTextField,
                "value": nickname
            ]
        ]
        
        let formValidation = FormValidator(params: params)
        
        if formValidation.isValid()
        {
            Context.shared.findContactService.find(nickname, callback: { (user: User) in
                Context.shared.currentUser.contacts.append(user)
                self.navigationController?.popToRootViewControllerAnimated(true)
            })
        }
    }
}
