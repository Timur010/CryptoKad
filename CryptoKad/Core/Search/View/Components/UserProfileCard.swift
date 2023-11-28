//
//  UserProfileCard.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 28.11.2023.
//

import SwiftUI

struct UserProfileCard: View {
    var name: String
    var body: some View {
        ZStack {
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.05, green: 0.21, blue: 0.19), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.05), location: 1.00),
                ],
                startPoint: UnitPoint(x: 1, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            ).cornerRadius(30)
            
            HStack (spacing: 10){
                Image("mokImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .contentShape(Circle())
                    .frame(width: 60, height: 60)
                
                VStack (alignment: .leading) {
                    Text(name)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color.white)
                    
                    Text("Подписчики: 3")
                        .foregroundStyle(Color.white.opacity(0.7))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Подписаться")
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(Color.white)
                        .background(Color.redColor.cornerRadius(10))
                }
                .padding(.trailing, 10)
            }
            .padding(5)
        }
        .frame(height: 60)
    }
}

#Preview {
    UserProfileCard(name: "Тимур")
}
