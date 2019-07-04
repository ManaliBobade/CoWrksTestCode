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
    
    func mapping(map: Map) {
        creator <- map["creator"]
        timestamp <- map["article.timelog"]
        location <- map["article.city_name"]
    }
    
    //TODO: Ideally every article should have a unique id
    var creator: ArticleCreator?
    var timestamp: Double = 0
    var location: String?
}

class ArticleCreator: NSObject, Mappable {
    
    required init?(map: Map) {
        
    }
    
    //TODO: Ideally every creator should have a unique id
    var name: String?
    
    func mapping(map: Map) {
        name <- map["name"]
    }

}
