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

    let userName = "user"
    let userPassword = "qwe"
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let userName = userNameTextfield.text, !userName.isEmpty else {
            showWrongUserDataError(errorType: .emptyUserNameField)
            return false
        }
        guard let userPass = userPasswordTextfield.text, !userPass.isEmpty else {
            showWrongUserDataError(errorType: .emptyUserPasswordField)
            return false
        }
        if userPass != userPassword || userName != userName {
            showWrongUserDataError(errorType: .wrongNameOrPassword)
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

    @IBAction func forgotUserNameButtonPressed() { showTip(tipType: .userName)}
    
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
            tip = userName
            tipTitle = "Ваше имя пользователя"
        case .userPassword:
            tip = userPassword
            tipTitle = "Ваш пароль"
        }
        
        let alert = UIAlertController(
            title: tipTitle,
            message: tip,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showWrongUserDataError(errorType: UserDataErrorType) {
        let errorTip: String
        
        switch errorType {
        case .emptyUserNameField:
            errorTip = "Enter username"
        case .emptyUserPasswordField:
            errorTip = "Enter password"
        case .wrongNameOrPassword:
            errorTip = "Wrong login or password!"
        }
        
        let alert = UIAlertController(
            title: "Error",
            message: errorTip,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true) {
            self.userPasswordTextfield.text = ""
        }
    }
}

// MARK: - Extensions

extension LogInViewController {
    enum TipType {
        case userName
        case userPassword
    }
    
    enum UserDataErrorType {
        case emptyUserNameField
        case emptyUserPasswordField
        case wrongNameOrPassword
    }
}
