//
//  ViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var loginButton: UIView!
    
    @IBOutlet var usernameTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    // MARK: - Public Properties
    let userName = "user"
    let userPassword = "qwe"
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let userName = usernameTextfield.text, !userName.isEmpty else {
            print("username shit!")
            return false
        }
        guard let userPass = passwordTextfield.text, !userPass.isEmpty else {
            print("pass shit!")
            return false
        }
        if userPass != userPassword || userName != userName {
            print("wrong password or username")
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
    }

    // MARK: - IB Actions
    @IBAction func forgotUserNameButtonPressed() {
    }
    
    @IBAction func forgotPasswordButtonPressed() {
    }
    
}

