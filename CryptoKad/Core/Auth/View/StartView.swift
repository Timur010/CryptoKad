//
//  ContentView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            heder
            Spacer()
            buttoms
            Spacer()
            bottomText
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.mainColor)
    }
}

#Preview {
    StartView()
}

extension StartView {
    private var heder: some View {
        VStack (spacing: 25) {
            Image("Logo")
                .frame(width: 50, height: 50)
            Text("Chat, discuss, follow and exchange cryptocurrency in one application")
                .lineLimit(2)
                .padding(.horizontal, 31)
                .foregroundStyle(Color.white)
                .font(.title3)
                .bold()
                .padding(.top, 20)
            Text("CryptoKad")
                .foregroundStyle(Color.buttonBrightPurple)
                .font(.title3)
                .bold()
                .padding()
        }
    }
    private var buttoms: some View {
        VStack {
            CreateAccountButton(text: "Create account", f: false)
            
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.white)
                Spacer()
                
                Text("OR")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 31)
            
            HStack {
                CreateAccountButton(image: "apple", text: "Apple", f: true)
                Spacer()
                CreateAccountButton(image: "google", text: "Google", f: true)
            }
            .padding(.horizontal, 31)
        }
    }
    private var bottomText: some View {
        HStack {
            Text("Already have an account?")
                .foregroundStyle(Color.white)
                .font(.title3)
            Button {
                
            } label: {
                Text("Log in")
                    .foregroundStyle(Color.buttonBrightPurple)
                    .font(.title3)
            }
            
            Spacer()
        }
        .padding(.horizontal, 31)
    }
}

