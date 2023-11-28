//
//  HomeEndpoint.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation

enum HomeEndpoint: Endpoint {
    case getTweets
    
    var path: String {
        switch self {
        case .getTweets:
            return API.HomeIPA.tweets
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getTweets:
            return.get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    
}
