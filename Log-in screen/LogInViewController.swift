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
            showWrongUserDataError(errorType: .emptyUserNameFieldOrPasswordField)
            return false
        }
        guard let userPass = userPasswordTextfield.text, !userPass.isEmpty else {
            showWrongUserDataError(errorType: .emptyUserNameFieldOrPasswordField)
            return false
        }
        if userPass == expectedUserPassword, userName == expectedUserName {
            return true
        }
        showWrongUserDataError(errorType: .wrongNameOrPassword)
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

    @IBAction func forgotUserNameButtonPressed() { showTip(tipType: .userName) }
    
    @IBAction func forgotPasswordButtonPressed() { showTip(tipType: .userPassword) }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        guard let weclomeVC = segue.source as? WelcomeViewController else { return }
        userNameTextfield.text = nil
        userPasswordTextfield.text = nil
    }
    
    // MARK: - Private Methods

    private func showTip(tipType: TipType) {
        let tip: String
        let tipTitle: String
        
        switch tipType {
        case .userName:
            tip = expectedUserName
            tipTitle = "Ваше имя пользователя"
        case .userPassword:
            tip = expectedUserPassword
            tipTitle = "Ваш пароль"
        }
        
        let alert = UIAlertController(
            title: tipTitle,
            message: tip,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showWrongUserDataError(errorType: UserDataErrorType) {
        let errorTip: String
        let errorAction: () -> Void
        
        switch errorType {
        case .emptyUserNameFieldOrPasswordField:
            errorTip = "Enter username and password"
            errorAction = {}
        case .wrongNameOrPassword:
            errorTip = "Wrong login or password!"
            errorAction = { self.userPasswordTextfield.text = "" }
        }
        
        let alert = UIAlertController(
            title: "Error",
            message: errorTip,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: errorAction)
    }
}

// MARK: - Extensions

extension LogInViewController {
    enum TipType {
        case userName
        case userPassword
    }
    
    enum UserDataErrorType {
        case emptyUserNameFieldOrPasswordField
        case wrongNameOrPassword
    }
}
