//
//  SearchDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation

enum SearchEndpoint: Endpoint {
    case search(searchText: String, current: SearchEnum, category: CategoryEnum, sortTime: SortTimeEnum)
    
    var path: String {
        switch self {
        case .search:
            return API.SearchAPI.search
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(let searchText, let current, let category, let sortTime):
            return [
                "name": searchText,
                "current": current.string,
                "category": category.string,
                "sortOrder": sortTime.string
            ]
        }
    }
}
