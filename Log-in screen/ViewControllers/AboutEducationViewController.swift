//
//  AboutEducationViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutEducationViewController: UIViewController {

    @IBOutlet var naviController: UINavigationItem!
    
    var ncTitle: String!
    var education: [Education]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = ncTitle
    }

}
