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
typealias GetFeedSuccessClosure = () -> Void

class WebClient : NSObject {
    
    static let sharedWebClient = WebClient()
    
    func getFeed(successHandler:@escaping GetFeedSuccessClosure, failureHandler:@escaping GetFeedFailureClosure) {
        //TODO: Ideally feed should be fetched page wise. Page number should go as parameter
        Alamofire.request(AlamofireRouter.getFeed(parameters: nil)).responseJSON {
            (response) in
            guard (response.result.value as? [String:Any]) != nil else {
                //Server or n/w error
                print(response.error ?? "Network Error:")
                //TODO: Pass exact error in failure handler
                failureHandler()
                return
            }
            print(response.result.debugDescription)
        }
    }
    
}
