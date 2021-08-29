//
//  AboutUserViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutUserViewController: UIViewController {

    @IBOutlet var navigationControllerTitle: UINavigationItem!
    
    var userData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControllerTitle.title = userData.userInfo.name
    }

}
