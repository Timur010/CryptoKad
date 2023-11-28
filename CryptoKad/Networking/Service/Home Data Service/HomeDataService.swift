//
//  HomeDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation

protocol HomeDataServiceProtocol {
    func featchTweets() async -> Result<[Tweets], RequestError>
}

class HomeDataService: Request, HomeDataServiceProtocol {
    static var homeDataService = HomeDataService()
    
    func featchTweets() async -> Result<[Tweets], RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getTweets, responseModel: [Tweets].self)
    }
}
