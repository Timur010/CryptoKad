//
//  Store.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

class Store: ObservableObject {
    @Published var currenTab: Tab = .home
    @Published var authStatus: Auth = .authFalse
    @Published var auth = true
}

enum Auth: String, CaseIterable {
    case authFalse, authTrue
}

enum Tab: String, CaseIterable {
    case home, searh, wallet, account
    
    var icon: String {
        switch self {
        case .home:
            return "home"
        case .searh:
            return "search"
        case .wallet:
            return "wallet"
        case .account:
            return "profile"
        }
    }
}

enum CurrenCategory {
    case news, advert
}
