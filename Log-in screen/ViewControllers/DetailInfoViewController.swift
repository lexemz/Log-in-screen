//
//  AboutSkillsViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class DetailInfoViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var naviController: UINavigationItem!
    @IBOutlet var detailedInfoLabel: UILabel!
    
    // MARK: - Public Properties
    var naviControllerTitle: String!
    var infoBlocks: [String]!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = naviControllerTitle
        
        unpackData()
        
    }
    
    // MARK: - Private Methods
    private func unpackData() {
        detailedInfoLabel.text = ""
        for infoBlock in infoBlocks {
            detailedInfoLabel.text?.append(infoBlock)
        }
    }
}
