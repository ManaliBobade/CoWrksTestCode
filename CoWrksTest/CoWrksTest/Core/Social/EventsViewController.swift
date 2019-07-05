//
//  EventsViewController.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 05/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class EventsViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "EVENTS")
    }

}
