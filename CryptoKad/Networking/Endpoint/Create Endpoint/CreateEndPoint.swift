//
//  CreateEndPoint.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 03.12.2023.
//

import Foundation

enum CreateEndPoint: Endpoint {
    case create(text: String, userName: String, userId: String, category: String)
    
    var path: String {
        switch self {
        case .create:
            return API.CreateTweets.creata
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .create:
            return .post
        }
    }
    
    var header: [String : String]? {
        return ["Authorization": "Bearer \(Constant.userToken)"]
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .create(let text, let userName, let userId, let category):
            return [
                "text": text,
                "username": userName,
                "userId": userId,
                "category": category
            ]
        }
    }
    
    
}
