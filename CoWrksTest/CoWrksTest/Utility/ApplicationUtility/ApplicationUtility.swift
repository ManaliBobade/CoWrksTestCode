//
//  ApplicationUtility.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 04/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit
import Foundation

class ApplicationUtility: NSObject {
    
    //Declare init as private for true singleton
    static let sharedApplicationUtility = ApplicationUtility()
    
    private var revealController : SWRevealViewController! = nil

    func renderHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sideMenu = storyboard.instantiateViewController(withIdentifier: "SideMenu")
        let homeParent = storyboard.instantiateViewController(withIdentifier: "HomeParent")
        revealController = SWRevealViewController(rearViewController: sideMenu, frontViewController: homeParent)
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = revealController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func toggleRevealController() {
        revealController.revealToggle(animated: true)
    }
    
}
