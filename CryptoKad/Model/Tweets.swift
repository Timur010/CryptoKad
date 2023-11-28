//
//  Tweets.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import Foundation

struct Tweets: Codable, Hashable {
    var _id: String
    var text: String
    var user: String?
    var username: String
    var userId: String
    var likes: [String]?
    var createdAt: String
    var updatedAt: String
    var __v: Int
    var image: HomeImage?
}

struct HomeImage: Codable, Hashable {
    var type: String
    var data:[Int]
}
