//
//  ViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var loginButton: UIView!
    
    @IBOutlet var usernameTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    let userName = "user"
    let userPassword = "qwe"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let name = usernameTextfield.text, !name.isEmpty else {
            print("username shit!")
            return false
        }
        guard let pass = passwordTextfield.text, !pass.isEmpty else {
            print("pass shit!")
            return false
        }
        if pass != userPassword || name != userName {
            print("wrong password or username")
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func forgotUserNameButtonPressed() {
    }
    
    @IBAction func forgotPasswordButtonPressed() {
    }
    
}

