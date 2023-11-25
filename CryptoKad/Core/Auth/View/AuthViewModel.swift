//
//  AuthViewModel.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

}
