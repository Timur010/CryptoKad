//
//  Registration.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var vm = AuthViewModel()
    var body: some View {
        VStack (spacing: 0){
            Image("Logo")
                .offset(y: -35)
            HStack {
                Text("Welcome to ")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
                Text("CryptoKad")
                    .foregroundStyle(Color.accentColor)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 5)
            
            VStack(spacing: 33) {
                TextFiledView(title: "Enter name", text: $vm.name)
                    .padding(.horizontal, 30)
                TextFiledView(title: "Enter username", text: $vm.userName)
                    .padding(.horizontal, 30)
                TextFiledView(title: "Enter email", text: $vm.email)
                    .padding(.horizontal, 30)
                TextFiledView(title: "Enter password", text: $vm.password)
                    .padding(.horizontal, 30)
            }
            .padding(.top, 33)
            
            Spacer()
            
            LogInButton(text: "Registration")
            
           
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.mainColor)
    }
}

#Preview {
    RegistrationView()
}
