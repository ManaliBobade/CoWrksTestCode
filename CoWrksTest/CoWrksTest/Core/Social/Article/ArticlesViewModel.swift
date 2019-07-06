//
//  ArticlesViewModel.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 06/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit

class ArticlesViewModel: NSObject {
    
    //TODO: Ideally save in database. Realm preferred
    private var allArticles = [Article]()
    
    var articleOffset = 0
    let pageSize = 10
    var fetchMoreData: Bool = true
    var isFetchingData: Bool = false
    
    var numberOfSections: Int { return 1 }
    var numberOfRows: Int { return allArticles.count }
    
    var reloadData: (()-> Void) = {}
    
    func getArticle(atIndex index: Int) -> Article? {
        if index >= 0 && index < allArticles.count {
            return(allArticles[index])
        }
        return nil
    }
    
    //Restarts data fetching. Return if pagination state was reset
    func getData () -> Bool {
        guard isFetchingData == false else {
            return false
        }
        resetPaginationState()
        isFetchingData = true
        WebClient.sharedWebClient.getFeed(offset:0, successHandler: { (newArticles) in
            self.finishedFetchingArticles(newArticles)
        }) {
            //TODO: Show failure on UI
            self.isFetchingData = false
        }
        return true
    }
    
    //Called when the next page of Data is required
    func getMoreData() {
        guard fetchMoreData == true, isFetchingData == false else {
            return
        }
        isFetchingData = true
        WebClient.sharedWebClient.getFeed(offset: articleOffset, successHandler: { (newArticles) in
            self.finishedFetchingArticles(newArticles)
        }) {
            //TODO: Show failure on UI
            self.isFetchingData = false
        }
    }
    
    func finishedFetchingArticles(_ newArticles: [Article]?) {
        if let newArticles = newArticles {
            self.allArticles.append(contentsOf: newArticles)
            self.updatePaginationState(articleCount: newArticles.count)
            self.reloadData()
            self.isFetchingData = false
        }else {
            //This never happens. Need not handle.
        }
    }
    
}

private typealias Pagination = ArticlesViewModel
extension Pagination {
    
    func resetPaginationState() {
        articleOffset = 0
        fetchMoreData = true
        allArticles.removeAll()
    }
    
    func updatePaginationState(articleCount: Int) {
        self.articleOffset += articleCount
        //Server returned < pagesize number of articles ... this is the last batch
        self.fetchMoreData = articleCount < self.pageSize ? false : true
    }
    
}



