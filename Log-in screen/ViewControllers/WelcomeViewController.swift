//
//  WelcomeViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var welcomeTitle: UILabel!
    @IBOutlet var logOutButton: UIButton!

    // MARK: - Public Properties

    var userName: String!

    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.layer.cornerRadius = 10
        welcomeTitle.text = "Welcome, " + userName.firstUppercased
        
        colorizeBackground()
    }
}

// MARK: - Extension for StringProtocol

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}

// MARK: - Extension for UIViewController

extension UIViewController {
    func colorizeBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        gradientLayer.colors = [
            UIColor(red: 138/255.0, green: 48/255.0, blue: 127/255.0, alpha: 1.0).cgColor,
            UIColor(red: 77/255.0, green: 81/255.0, blue: 142/255.0, alpha: 1.0).cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
