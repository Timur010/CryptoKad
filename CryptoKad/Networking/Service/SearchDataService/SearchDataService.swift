//
//  SearchDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation
protocol SearchDataServiceProtocol {
    func search(searchText: String, current: SearchEnum , category: CategoryEnum, sortTime: SortTimeEnum ) async -> Result<[Tweets], RequestError>
}

class SearchDataService: Request, SearchDataServiceProtocol {
    static let searchDataService = SearchDataService()
    
    func search(searchText: String, current: SearchEnum , category: CategoryEnum, sortTime: SortTimeEnum ) async -> Result<[Tweets], RequestError> {
        return await sendRequest(endpoint: SearchEndpoint.search(searchText: searchText, current: current, category: category, sortTime: sortTime), responseModel: [Tweets].self)
    }
    
    
}
