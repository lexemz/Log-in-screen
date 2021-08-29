//
//  AboutSkillsViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutSkillsViewController: UIViewController {
    
    @IBOutlet var naviController: UINavigationItem!
    @IBOutlet var skillsLabel: UILabel!
    
    var ncTitle: String!
    var skills: [Skill]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = ncTitle
        
        unpackData()
    }
    
    private func unpackData() {
        skillsLabel.text = ""
        for skill in skills {
            skillsLabel.text?.append(skill.getInfo)
        }
    }
}
