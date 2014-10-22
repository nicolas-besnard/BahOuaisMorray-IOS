//
//  UserMenuViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class UserMenuViewController: UITableViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "Logout"
        {
            Context.shared.currentUser.resetDatas()
        }
    }
}

