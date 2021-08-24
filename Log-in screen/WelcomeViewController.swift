//
//  UserViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var userWelcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userName.dropFirst())
        userWelcomeLabel.text = "Welcome, " + userName.firstUppercased
    }
    
    @IBAction func logOutBtnP() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
