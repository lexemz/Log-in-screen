//
//  AboutUserViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutUserViewController: UIViewController {

    @IBOutlet var naviController: UINavigationItem!
    
    @IBOutlet var skillsButton: UIButton!
    @IBOutlet var hobbiesButton: UIButton!
    @IBOutlet var educationButton: UIButton!
    
    var userInfo: Human!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = userInfo.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let aboutSkillsVC = destination as? AboutSkillsViewController {
            if let skills = userInfo.skills {
                aboutSkillsVC.skills = skills
                aboutSkillsVC.ncTitle = skillsButton.currentTitle
            }
        } else if let aboutHobbiesVC = destination as? AboutHobbiesViewController {
            if let hobbies = userInfo.hobbies {
                aboutHobbiesVC.hobbies = hobbies
                aboutHobbiesVC.ncTitle = hobbiesButton.currentTitle
            }
        } else if let aboutEducationVC = destination as? AboutEducationViewController {
            if let education = userInfo.education {
                aboutEducationVC.education = education
                aboutEducationVC.ncTitle = educationButton.currentTitle
            }
        }
    }
}
