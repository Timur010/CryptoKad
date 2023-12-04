//
//  CreateDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 03.12.2023.
//

import Foundation

protocol CreateDataServiceProtocol {
    func create(text: String, userName: String, userId: String, category: String) async -> Result<Tweets, RequestError>
}

class CreateDataService: Request, CreateDataServiceProtocol {
    static var createDataService = CreateDataService()
    
    func create(text: String, userName: String, userId: String, category: String) async -> Result<Tweets, RequestError> {
        return await sendRequest(endpoint: CreateEndPoint.create(text: text, userName: userName, userId: userId, category: category), responseModel: Tweets.self)
    }
}
