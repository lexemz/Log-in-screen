//
//  AboutUserViewController.swift
//  Log-in screen
//
//  Created by Igor on 29.08.2021.
//

import UIKit

class AboutUserViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var naviController: UINavigationItem!

    @IBOutlet var skillsButton: UIButton!
    @IBOutlet var hobbiesButton: UIButton!
    @IBOutlet var educationButton: UIButton!

    // MARK: - Public Properties

    var userInfo: Human!

    // MARK: - Private Properties

    private var pushingNaviControllerTitle = ""
    private var pushingUserDetailInfoBLocks: [String] = []

    // MARK: - Life Cycles Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        naviController.title = userInfo.name
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVc = segue.destination as? DetailInfoViewController else { return }
        detailVc.naviControllerTitle = pushingNaviControllerTitle
        detailVc.infoBlocks = pushingUserDetailInfoBLocks
    }

    // MARK: - IB Actions

    @IBAction func btnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard let userSkills = userInfo.skills else { return }
            pushingNaviControllerTitle = skillsButton.currentTitle!

            for skill in userSkills {
                pushingUserDetailInfoBLocks.append(skill.getInfo)
            }
        case 1:
            guard let userHobbies = userInfo.hobbies else { return }
            pushingNaviControllerTitle = hobbiesButton.currentTitle!

            for hobbie in userHobbies {
                pushingUserDetailInfoBLocks.append(hobbie.getInfo)
            }
        default:
            guard let userEducation = userInfo.education else { return }
            pushingNaviControllerTitle = educationButton.currentTitle!

            for educationInstance in userEducation {
                pushingUserDetailInfoBLocks.append(educationInstance.getInfo)
            }
        }

        performSegue(withIdentifier: "showDetailInfo", sender: nil)
        
        pushingNaviControllerTitle = ""
        pushingUserDetailInfoBLocks = []
    }
}
