//
//  AccountView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 26.11.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject private var store: Store
    var body: some View {
        VStack {
            Image("mokImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .contentShape(Circle())
                .frame(width: 150, height: 150)
            Text("Тимур")
                .font(.title)
                .bold()
            
//            Spacer()
            
            Button {
                store.authStatus = .authFalse
            }label: {
                Text("Выйти")
            }
        }
        
    
    }
}

#Preview {
    AccountView()
}
