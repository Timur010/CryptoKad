//
//  SearchViewModel.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation
@MainActor
class SearchViewModel: ObservableObject {
    let searchDataService: SearchDataServiceProtocol
    
    init(searchDataService: SearchDataServiceProtocol) {
        self.searchDataService = searchDataService
    }
    
    @Published var searchText = ""
    @Published var users: [User] = []
    
    func search() async {
        let resault = await searchDataService.search(searchText: searchText)
        switch resault {
        case .success(let data):
            print("Кайф")
            users = data
        case .failure(let failure):
            print(failure)
        }
    }
}

