//
//  AuthViewModel.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import Foundation
@MainActor
class AuthViewModel: ObservableObject {
    
    let authDataService: AuthDataServiceProtocol
    
    init(authDataService: AuthDataServiceProtocol) {
        self.authDataService = authDataService
    }
    
    @Published var name: String = ""
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var status: ViewStatus = .loading
    @Published var isLoaded: Bool = false
    @Published var isLogIn: Bool = false
    
    func create() async {
        status = .loading
        let resault = await authDataService.createUser(user: User(name: name, username: userName, email: email, followers: nil, followings: nil, _id: nil, tokens: nil, __v: nil, password: password))
        switch resault {
        case .success(let success):
            await logIn()
            print(success)
            status = .loaded
            isLoaded = true
        case .failure(let failure):
            status = .error
            print(failure)
            
        }
    }
    
    func logIn() async {
        let resault = await authDataService.logIn(email: email, password: password)
        switch resault {
        case .success(let success):
            Constant.userToken = success.token
            Constant.userId = success.user._id ?? ""
            isLogIn = true
        case .failure(let failure):
            print(failure)
        }
    }
}
