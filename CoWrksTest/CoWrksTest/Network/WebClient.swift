//
//  WebClient.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 04/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireObjectMapper


typealias GetFeedFailureClosure = () -> Void
typealias GetFeedSuccessClosure = (_ articles: [Article]?) -> Void

class WebClient : NSObject {
    
    //Declare init as private for true singleton
    static let sharedWebClient = WebClient()
    
    func getFeed(successHandler:@escaping GetFeedSuccessClosure, failureHandler:@escaping GetFeedFailureClosure) {
        //TODO: Ideally feed should be fetched page wise. Page number should go as parameter
        Alamofire.request(AlamofireRouter.getFeed(parameters: nil)).responseArray(keyPath: "data") {
            (response: DataResponse<[Article]>) in
            
            guard response.error == nil else {
                //Server or n/w error
                print(response.error ?? "Network Error:")
                //TODO: Pass exact error in failure handler
                failureHandler()
                return
            }
            
            //All Good! ... Send array of articles to controller
            successHandler(response.result.value)
        }
    }
    
}


//WebClient.sharedWebClient.getFeed(successHandler: {
//    articles in
//    guard let articles = articles else {
//        //Handle no articles received
//        return
//    }
//    for article in articles {
//        print(article.creator?.name ?? "")
//    }
//
//}) {
//    //TODO: Handle server, n/w failure
//
//}

