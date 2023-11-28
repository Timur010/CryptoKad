//
//  AuthDataService.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

protocol AuthDataServiceProtocol {
    func createUser(user: User) async -> Result<User, RequestError>
    func logIn(email: String, password: String) async -> Result<UserRespons, RequestError>
}

class AuthDataService: Request, AuthDataServiceProtocol {
    static let authDataService = AuthDataService()
    
    func createUser(user: User) async -> Result<User, RequestError> {
        return await sendRequest(endpoint: AuthEndpoint.createUser(user: user), responseModel: User.self)
    }
    func logIn(email: String, password: String) async -> Result<UserRespons, RequestError> {
        return await sendRequest(endpoint: AuthEndpoint.logIn(email: email, password: password), responseModel: UserRespons.self)
    }
    
}
