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
        //TODO: Every time view appears empty previous data
        getArticles()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindToViewModel() {
        viewModel.reloadData = {
            self.didFinishGettingData()
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Will scroll past the last cell
        if indexPath.row + 1 == viewModel.numberOfRows {
            getMoreArticles()
        }
    }
    
}

private typealias Pagination = ArticlesViewController
extension Pagination {
    
    //TODO: Add activity indicator when API is executed
    func getArticles() {
        let dataReset = viewModel.getData()
        //Pagination state is reset. Show on UI
        if dataReset {
            tableView.reloadData()
        }
    }
    
    func getMoreArticles() {
        //Show pagination activity on UI
        tableView.tableFooterView?.isHidden = false
        viewModel.getMoreData()
    }
    
    func didFinishGettingData() {
        DispatchQueue.main.async {
            self.tableView.tableFooterView?.isHidden = true
            self.tableView.reloadData()
        }
    }
    
}

private typealias PagerStripIndicatorInfo = ArticlesViewController
extension PagerStripIndicatorInfo : IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "STREAM")
    }
    
}
