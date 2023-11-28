//
//  HomeViewModel.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import SwiftUI
@MainActor
class HomeViewModel: ObservableObject {
    let homeDataService: HomeDataServiceProtocol
    
    init(homeDataService: HomeDataServiceProtocol) {
        self.homeDataService = homeDataService
    }
    
    @Published var tweets: [Tweets] = []
    @Published var btc = [12.00, 15.135, 345.90, 14975.00, 19765.00, 34976.65, 12987.00, 1456.00, 64987.00, 12000.000, 12.00, 15.135, 345.90, 14975.00, 19765.00, 34976.65, 12987.00, 1456.00, 64987.00, 12000.000, 32.4355]
    @Published var ethere = [12.00, 15.135, 345.90, 14975.00, 19765.00, 12976.65, 15987.00, 8456.00, 94987.00, 62000.000, 152.00, 1865.135, 3445.90, 1975.00, 1765.00, 34976.65, 12987.00, 1456.00, 6987.00, 5000.000,]
    @Published var usdt = [12.00, 15.135, 345.90, 14975.00, 19765.00, 12976.65, 15987.00, 8456.00, 94987.00, 62000.000, 152.00, 1865.135, 3445.90, 1975.00, 1765.00, 34976.65, 12987.00, 1456.00, 6987.00, 5000.000, 32.4355]
    
    
    func fetchTwetts() async {
        let resault = await homeDataService.featchTweets()
        switch resault {
        case .success(let data):
            tweets = data
            print("Кайф")
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
                print(dateString)
            } else {
                print("Ошибка при преобразовании даты для объекта \(i)")
            }
        }
    }
}
