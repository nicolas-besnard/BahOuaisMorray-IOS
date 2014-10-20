//
//  UserHomeViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class UserHomeViewController: UIViewController
{
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        deleteBackButton()
    }

    private func deleteBackButton()
    {
        let tmpView = UIView(frame: CGRectZero)
        let button = UIBarButtonItem(customView: tmpView)
        navigationItem.setLeftBarButtonItem(button, animated: false)
    }
}
