//
//  SearchEndpoint.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 04.12.2023.
//

import Foundation

enum SearchEnum: String, CaseIterable  {
    case User, Posts
    
    var string: String {
        switch self {
        case .User:
            return "User"
        case .Posts:
            return "Posts"
        }
    }
}
