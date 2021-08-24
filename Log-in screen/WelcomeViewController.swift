//
//  WelcomeViewController.swift
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
        userWelcomeLabel.text = "Welcome, " + userName.firstUppercased
    }

}

// MARK: - Extensions
extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
