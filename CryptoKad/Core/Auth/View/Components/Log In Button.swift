//
//  Log In Button.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct LogInButton: View {
    var text: String
    var action: () -> ()
    var body: some View {
        Button {
           action()
        } label: {
            Text(text)
                .frame(width: 220)
                .padding(.vertical )
                .font(.title2)
                .foregroundStyle(Color.white)
                .background(Color.buttonBrightPurple.cornerRadius(20))
        }
        }
       
}

#Preview {
    LogInButton(text: "Registration", action: ({}))
}
