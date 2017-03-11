//
//  ViewController.swift
//  NAChatting
//
//  Created by zeyong shan on 3/10/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var NameLaebl: UILabel!
    @IBOutlet private weak var waiting: UIActivityIndicatorView!
    
    @IBAction private func login() {
        waiting.startAnimating()
        AccountSetting.logInWithEmail(emailTextField.text!, passwordTextField.text!)
        {
            (error) in
            if(error != nil)
            {
                self.NameLaebl.text = error!
            }
            else
            {
                self.performSegue(withIdentifier: "toMain", sender: nil)
            }
            self.waiting.stopAnimating()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        waiting.startAnimating()
        self.waiting.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
        AccountSetting.logInWithSavedAccount()
        { (error) in
            if error == nil
            {
                self.performSegue(withIdentifier: "toMain", sender: nil)
            }
            else
            {
                self.waiting.stopAnimating()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

