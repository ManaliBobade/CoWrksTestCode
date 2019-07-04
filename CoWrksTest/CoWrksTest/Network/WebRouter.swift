//
//  WebRouter.swift
//  CoWrksTest
//
//  Created by Manali Bobade on 04/07/19.
//  Copyright © 2019 Manali Bobade. All rights reserved.
//

import Foundation
import Alamofire

enum AlamofireRouter: URLRequestConvertible {
    
    static let baseURL: String = "http://www.mocky.io/v2/5d1d877b3000009900d71f99?mocky-delay=3000ms"

    case getFeed(parameters: [String: AnyObject]?)
    
    // create and return the URL request
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            return .get
        }
        
        let url: URL = {
            let url = URL(string: AlamofireRouter.baseURL)!
            return url
        }()
        
        let params: ([String: Any]?) = {
            switch self {
            case .getFeed:
                return nil
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}




