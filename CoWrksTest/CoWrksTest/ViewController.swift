//
//  ViewController.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 04/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hamburgerTapped(sender: UIButton) {
        ApplicationUtility.sharedApplicationUtility.toggleRevealController()
    }

}

