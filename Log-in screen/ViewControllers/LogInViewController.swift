//
//  LogInViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var logInButton: UIButton!
    
    @IBOutlet var userNameTextfield: UITextField!
    @IBOutlet var userPasswordTextfield: UITextField!
    
    // MARK: - Public Properties

    private let expectedUserName = "user"
    private let expectedUserPassword = "qwe"
    
    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextfield.delegate = self
        userPasswordTextfield.delegate = self
        
        logInButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let aboutUserViewController = viewController as? UINavigationController {
                let userInfoVC = aboutUserViewController.topViewController as! AboutUserViewController
                userInfoVC.userName = expectedUserName
            }
        }
    }

    // MARK: - IB Actions

    @IBAction func LogInButtonPressed() {
        guard let userName = userNameTextfield.text, !userName.isEmpty else {
            showAlertController(alertType: .emptyUserNameFieldOrPasswordField)
            return
        }
        guard let userPass = userPasswordTextfield.text, !userPass.isEmpty else {
            showAlertController(alertType: .emptyUserNameFieldOrPasswordField)
            return
        }
        guard userPass == expectedUserPassword, userName == expectedUserName else {
            showAlertController(alertType: .wrongNameOrPassword)
            return
        }
        performSegue(withIdentifier: "loginButtonSegue", sender: nil)
    }
        
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlertController(alertType: .userNameTip)
        } else {
            showAlertController(alertType: .userPasswordTip)
        }
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        userNameTextfield.text = nil
        userPasswordTextfield.text = nil
    }
    
    // MARK: - Private Methods
    
    private func showAlertController(alertType: AlertType) {
        let alertTitle: String
        let alertMessage: String
        var alertAction: () -> Void = {}
        
        switch alertType {
        case .emptyUserNameFieldOrPasswordField:
            alertTitle = "Error"
            alertMessage = "Enter username and password"
        case .wrongNameOrPassword:
            alertTitle = "Error"
            alertMessage = "Wrong login or password!"
            alertAction = { self.userPasswordTextfield.text = nil }
        case .userNameTip:
            alertTitle = "Your username"
            alertMessage = expectedUserName
        case .userPasswordTip:
            alertTitle = "Your password"
            alertMessage = expectedUserPassword
        }
        
        let alert = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: UIAlertController.Style.alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: alertAction)
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    // Hide keyboard with touch on free space
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextfield {
            userPasswordTextfield.becomeFirstResponder()
        } else {
            // Not found next responder, run segue
            LogInButtonPressed()
        }
        return false
    }
}

// MARK: - Extension for LogInViewController - type of alert controller

extension LogInViewController {
    enum AlertType {
        case emptyUserNameFieldOrPasswordField
        case wrongNameOrPassword
        case userNameTip
        case userPasswordTip
    }
}
