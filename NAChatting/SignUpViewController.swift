//
//  SignUpViewController.swift
//  NAChatting
//
//  Created by zeyong shan on 3/10/17.
//  Copyright © 2017 zeyong shan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        waiting.hidesWhenStopped = true
        waiting.stopAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var retypeTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var waiting: UIActivityIndicatorView!
    
    @IBAction private func signUp() {
        waiting.startAnimating()
        AccountSetting.signUpWithEmail(emailTextField.text!, passwordTextField.text!)
        {
            (error) in
            if error == nil
            {
                self.nameLabel.text = error
                self.performSegue(withIdentifier: "SignUpToMain", sender: nil)
                self.nameLabel.text = error
                AccountInfo.storeNameAndEmail(self.nameTextField.text!, self.emailTextField.text!)
            }else{
                self.nameLabel.text = error
            }
            self.waiting.stopAnimating()
        }
    }
    
}
