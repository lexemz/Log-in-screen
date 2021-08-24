//
//  LogInViewController.swift
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
    
    // not worked!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    // MARK: - IB Actions

    @IBAction func forgotUserNameButtonPressed() { showTip(tipType: .login)}
    
    @IBAction func forgotPasswordButtonPressed() { showTip(tipType: .password) }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        guard let weclomeVC = segue.source as? WelcomeViewController else { return }
        usernameTextfield.text = nil
        passwordTextfield.text = nil
    }
    
    // MARK: - Private Methods
    private func showTip(tipType: TipType) {
        var tip: String
        var tipTitle: String
        
        switch tipType {
        case .login:
            tip = userName
            tipTitle = "Ваше имя пользователя"
        case .password:
            tip = userPassword
            tipTitle = "Ваш пароль"
        }
        
        let alert = UIAlertController(
            title: tipTitle,
            message: tip,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "Понял", style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension LogInViewController {
    enum TipType {
        case login
        case password
    }
}
