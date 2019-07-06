//
//  Article.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 04/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import Foundation
import ObjectMapper

class Article: Mappable {
    
    required init?(map: Map) {
        
    }
    
    //TODO: Ideally every article should have a unique id
    var creator: ArticleCreator?
    var timestamp: Double = 0
    var location: String?
    var content: String?
    var likes = [ArticleLikes]()
    
    func mapping(map: Map) {
        creator <- map["creator"]
        timestamp <- map["article.timelog"]
        location <- map["article.city_name"]
        content <- map["article.content"]
        likes <- map["article.likes"]
    }
    
}

class ArticleCreator: NSObject, Mappable {
    
    required init?(map: Map) {
        
    }
    
    //TODO: Ideally every creator should have a unique id
    var name: String?
    var company: String?
    
    func mapping(map: Map) {
        name <- map["name"]
        company <- map["company"]
    }

}

class ArticleLikes: NSObject, Mappable {
    
    required init?(map: Map) {
        
    }
    
    var name: String?
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
}

