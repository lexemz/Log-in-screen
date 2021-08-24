//
//  LogInViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets

    @IBOutlet var loginButton: UIView!
    
    @IBOutlet var userNameTextfield: UITextField!
    @IBOutlet var userPasswordTextfield: UITextField!
    
    // MARK: - Public Properties

    let expectedUserName = "user"
    let expectedUserPassword = "123"
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextfield.delegate = self
        userNameTextfield.tag = 0
        userPasswordTextfield.delegate = self
        userPasswordTextfield.tag = 1
        
        loginButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let userName = userNameTextfield.text, !userName.isEmpty else {
            showAlertController(alertType: .emptyUserNameFieldOrPasswordField)
            return false
        }
        guard let userPass = userPasswordTextfield.text, !userPass.isEmpty else {
            showAlertController(alertType: .emptyUserNameFieldOrPasswordField)
            return false
        }
        
        if userPass == expectedUserPassword, userName == expectedUserName {
            return true
        }
        
        showAlertController(alertType: .wrongNameOrPassword)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = expectedUserName
    }
    
    // hide keyboard with touch on free space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IB Actions

    @IBAction func forgotUserNameButtonPressed() { showAlertController(alertType: .userNameTip) }
    
    @IBAction func forgotPasswordButtonPressed() { showAlertController(alertType: .userPasswordTip) }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextfield.text = nil
        userPasswordTextfield.text = nil
    }
    
    // MARK: - Public Methods

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
//            textField.resignFirstResponder()

            if shouldPerformSegue(withIdentifier: "loginButtonSegue", sender: nil) {
                performSegue(withIdentifier: "loginButtonSegue", sender: nil)
            }
        }
        // Do not add a line break
        return false
    }
    
    // MARK: - Private Methods
    
    private func showAlertController(alertType: AlertType) {
        let alertTitle: String
        let alertSubtitle: String
        var alertAction: () -> Void = {}
        
        switch alertType {
        case .emptyUserNameFieldOrPasswordField:
            alertTitle = "Error"
            alertSubtitle = "Enter username and password"
        case .wrongNameOrPassword:
            alertTitle = "Error"
            alertSubtitle = "Wrong login or password!"
            alertAction = { self.userPasswordTextfield.text = nil }
        case .userNameTip:
            alertTitle = "Ваше имя пользователя"
            alertSubtitle = expectedUserName
        case .userPasswordTip:
            alertTitle = "Ваш пароль"
            alertSubtitle = expectedUserPassword
        }
        
        let alert = UIAlertController(
            title: alertTitle,
            message: alertSubtitle,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: alertAction)
    }
}

// MARK: - Extensions

extension LogInViewController {
    enum AlertType {
        case emptyUserNameFieldOrPasswordField
        case wrongNameOrPassword
        case userNameTip
        case userPasswordTip
    }
}
