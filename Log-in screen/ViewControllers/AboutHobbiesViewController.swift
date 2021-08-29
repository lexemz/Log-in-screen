//
//  AboutHobbiesViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutHobbiesViewController: UIViewController {
    
    @IBOutlet var naviController: UINavigationItem!
    @IBOutlet var skillsLabel: UILabel!
    
    var ncTitle: String!
    var hobbies: [Hobbie]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = ncTitle
    }
    
}
