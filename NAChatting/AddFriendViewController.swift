//
//  AddFriendViewController.swift
//  NAChatting
//
//  Created by zeyong shan on 3/11/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet private weak var NameLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!

    @IBAction private func add(_ sender: UIButton) {
        let error = FriendBase.addFriend(emailTextField.text!)
        if error != nil
        {
            NameLabel.text = error
        }
        else
        {
            NameLabel.text = "Add friend successful!"
        }
    }
    
    @IBAction private func back() {
        self.performSegue(withIdentifier: "backToFriendList", sender: nil)
    }
}
