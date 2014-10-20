//
//  UserMenuViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 20/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    let menuItems = ["Ajouter un contact", "Partager", "Feedback", "Déconnexion"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate   = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserMenuCell") as UITableViewCell
        
        cell.textLabel.text = menuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.navigationController?.performSegueWithIdentifier("ShowAddContact", sender: nil)
        }
    }
}
