//
//  FriendListViewController.swift
//  NAChatting
//
//  Created by zeyong shan on 3/11/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout() {
        AccountSetting.logOut()
            {
                (error) in
        }
        
    }

}