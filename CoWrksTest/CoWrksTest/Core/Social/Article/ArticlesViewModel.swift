//
//  ArticlesViewModel.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 06/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import UIKit

class ArticlesViewModel: NSObject {
    
    private var allArticles = [Article]()
    
    var numberOfSections: Int { return 1 }
    var numberOfRows: Int { return allArticles.count }
    
    var reloadData: (()-> Void) = {}
    
    func getData () {
        WebClient.sharedWebClient.getFeed(successHandler: { (newArticles) in
            if let newArticles = newArticles {
                self.allArticles.append(contentsOf: newArticles)
                self.reloadData()
            }
        }) {
            //TODO: Show failure on UI
        }
    }
    
    func getArticle(atIndex index: Int) -> Article? {
        if index >= 0 && index < allArticles.count {
            return(allArticles[index])
        }
        return nil
    }
    
}

