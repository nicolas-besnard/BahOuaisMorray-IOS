//
//  ViewController.swift
//  BahOuaisMorray
//
//  Created by Nicolas Besnard on 18/10/2014.
//  Copyright (c) 2014 Nicolas Besnard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        println(Context.shared.currentUser.token)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        if let hasToken = Context.shared.currentUser.token
        {
            self.navigationController?.performSegueWithIdentifier("ShowHome", sender: nil)
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

