//
//  User.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

struct token: Codable, Hashable {
    let token: String
    let _id: String
}

struct User: Codable, Hashable {
    let name: String?
    let username: String?
    let email: String?
    let followers: [String]?
    let followings: [String]?
    let _id: String?
    let tokens: [token]?
    let __v: Int?
    let password: String?
}

struct UserRespons: Codable, Hashable{
    let user: User
    let token: String
}
