//
//  AuthEndpoint.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case createUser(user: User)
    case logIn(email: String, password: String)
    
    var path: String {
        switch self {
        case .createUser:
            return API.AutHAPI.create
        case .logIn:
            return API.AutHAPI.logIn
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .createUser, .logIn:
            return .post
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .createUser(let user):
             return [
                "name": user.name as Any,
                "username": user.username as Any,
                "email": user.email as Any,
                "password": user.password as Any,
             ]
        case .logIn(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        }
    }
    
    
}
