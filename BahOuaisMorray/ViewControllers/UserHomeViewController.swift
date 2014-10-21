//
//  UserHomeViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class UserHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    weak var currentUser: CurrentUser!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentUser = Context.shared.currentUser
        tableView.delegate = self
        tableView.dataSource = self
    }
    
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return currentUser.contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("UserHomeCell") as UITableViewCell
        
        cell.textLabel.text = currentUser.contacts[indexPath.row].nickname
        
        return cell
    }
}
