//
//  LogInButton.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct CreateAccountButton: View {
    var image: String?
    var text: String
    var f: Bool
    var body: some View {
        NavigationLink {
            if !f {
                RegistrationView()
            }
        } label: {
            HStack (spacing: 9) {
                if image != "" && image != nil{
                    Image (image ?? "")
                        .frame(width: 38, height: 30)
                }
                Text(text)
                    .font(.title2)
                    .foregroundStyle(Color.white)
                    .bold()
            }
            .padding(.vertical, f ? 17 : 13 )
            .padding(.horizontal, f ? 20 : 49)
            .background(Color.fieldColor.cornerRadius(30))
        }
    }
}

#Preview {
    CreateAccountButton(image: "apple", text: "Apple", f: true)
}
