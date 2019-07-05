//
//  ArticlesViewController.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 05/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ArticlesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

private typealias TableView = ArticlesViewController
extension TableView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Article")
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
}

private typealias PagerStripIndicatorInfo = ArticlesViewController
extension PagerStripIndicatorInfo : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "STREAM")
    }
    
}
