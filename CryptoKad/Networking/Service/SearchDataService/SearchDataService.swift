//
//  SearchDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation
protocol SearchDataServiceProtocol {
    func search(searchText: String) async -> Result<[User], RequestError>
}

class SearchDataService: Request, SearchDataServiceProtocol {
    static let searchDataService = SearchDataService()
    
    func search(searchText: String) async -> Result<[User], RequestError> {
        return await sendRequest(endpoint: SearchEndpoint.search(searchText: searchText), responseModel: [User].self)
    }
    
    
}
