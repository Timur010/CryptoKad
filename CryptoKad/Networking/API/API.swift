//
//  API.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

struct API {
    static var baseURL = "http://192.168.137.69:3000"
    
    struct AutHAPI {
        static var create = "/users"
        static var logIn = "/users/login"
    }
    struct HomeIPA {
        static var tweets = "/tweets"
    }
    struct SearchAPI {
        static var search = "/user/search?name=ti"
    }
}

