//
//  CryptoKadApp.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

@main
struct CryptoKadApp: App {
    @StateObject var store = Store()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                switch store.authStatus {
                case .authFalse:
                    StartView()
                        .environmentObject(store)
                case .authTrue:
                    TabBarView()
                        .environmentObject(store)
                }
            }
        }
    }
}
