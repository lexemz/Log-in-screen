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
    
    @IBOutlet var userNameTextfield: UITextField!
    @IBOutlet var userPasswordTextfield: UITextField!
    
    // MARK: - Public Properties

    let expectedUserName = "user"
    let expectedUserPassword = "123"
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // hide keyboard with touch
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
    
    // MARK: - Private Methods
    
    private func showAlertController(alertType: AlertType) {
        let alertTitle: String
        let alertSubtitle: String
        var alertAction: () -> Void = { return }
        
        switch alertType {
        case .emptyUserNameFieldOrPasswordField:
            alertTitle = "Error"
            alertSubtitle = "Enter username and password"
        case .wrongNameOrPassword:
            alertTitle = "Error"
            alertSubtitle = "Wrong login or password!"
            alertAction = { self.userPasswordTextfield.text = "" }
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
