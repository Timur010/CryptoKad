//
//  LogInView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject private var store: Store
    @EnvironmentObject var vm: AuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack (spacing: 0){
            Image("Logo")
                .offset(y: -35)
           
                Text("Login to your account using your email")
                    .padding(.horizontal, 14)
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
                    .padding(.top, 5)
                    .padding(.trailing, 30)
            
            VStack(spacing: 33) {
                TextFiledView(title: "Enter email", text: $vm.email)
                    .padding(.horizontal, 30)
                TextFiledView(title: "Enter password", text: $vm.password)
                    .padding(.horizontal, 30)
                
            }
            .padding(.top, 33)
            
            
            NavigationLink {
                
            } label: {
                Text("Forgot password?")
                    .font(.title3)
                    .foregroundStyle(Color.buttonBrightPurple)
                    .padding(.top, 34)
                    .padding(.leading, 170)
            }
            
            Spacer()
            
            LogInButton(text: "Log In", action: {
                Task {
                    await vm.logIn()
                }
            })
        }
        .onChange(of: vm.isLogIn, { oldValue, newValue in
            if newValue {
                store.authStatus = .authTrue
                dismiss()
            }
        })
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.mainColor)
    }
}

#Preview {
    LogInView()
}
