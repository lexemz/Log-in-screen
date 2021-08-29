//
//  WelcomeViewController.swift
//  Log-in screen
//
//  Created by Igor on 24.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var logOutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.layer.cornerRadius = 10
        colorizeBackground()
    }
    
    private func colorizeBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [
            UIColor(red:138/255.0, green:48/255.0, blue:127/255.0, alpha:1.0).cgColor,
            UIColor(red:77/255.0, green:81/255.0, blue:142/255.0, alpha:1.0).cgColor
        ]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

