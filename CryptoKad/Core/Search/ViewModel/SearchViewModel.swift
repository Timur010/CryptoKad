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
    @Published var tweets: [Tweets] = []
    @Published var current: SearchEnum = .Posts
    @Published var category: CategoryEnum = .none
    @Published var sortTime: SortTimeEnum = .old
    
    func search() async {
        let resault = await searchDataService.search(searchText: searchText, current: current, category: category, sortTime: sortTime)
        switch resault {
        case .success(let data):
            tweets = data
            formater()
        case .failure(let failure):
            print(failure)
        }
    }
    
    func formater() {
        for i in 0..<tweets.count {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

            if let date = dateFormatter.date(from: tweets[i].createdAt) {
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = dateFormatter.string(from: date)
                tweets[i].createdAt = dateString
            } else {
                print("Ошибка при преобразовании даты для объекта \(i)")
            }
        }
    }
}

