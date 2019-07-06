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
    
    var viewModel: ArticlesViewModel = ArticlesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindToViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //TODO: Add activity indicator when API is executed
    func bindToViewModel() {
        viewModel.reloadData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

private typealias TableView = ArticlesViewController
extension TableView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Articles", for: indexPath) as! ArticleCell
        if let article = viewModel.getArticle(atIndex: indexPath.row) {
            cell.setup(article)
        }
        return cell
    }
    
}

private typealias PagerStripIndicatorInfo = ArticlesViewController
extension PagerStripIndicatorInfo : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "STREAM")
    }
    
}
