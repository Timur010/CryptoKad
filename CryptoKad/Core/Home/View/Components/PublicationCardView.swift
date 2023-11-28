//
//  PublicationCardView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 26.11.2023.
//

import SwiftUI

struct PublicationCardView: View {
    var creatorName: String
    var createdAt: String
    var text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack (spacing: 10){
                Image("mokImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .contentShape(Circle())
                    .frame(width: 50, height: 50)
                VStack (alignment: .leading, spacing: 5) {
                    Text(creatorName)
                        .foregroundStyle(Color.white)
                    Text(createdAt)
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Подписаться")
                        .padding(.vertical, 6)
                        .padding(.horizontal, 15)
                        .foregroundStyle(Color.white)
                        .background(LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.05, green: 0.21, blue: 0.19), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.05), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0),
                            endPoint: UnitPoint(x: 1, y: 1)).cornerRadius(10))
                }
            }
            .padding()
            
            Text(text)
                .padding()
                .lineLimit(5)
                .foregroundStyle(Color.white)
            Image("mokImage")
                .resizable()
                .padding()
                .frame(height: UIScreen.main.bounds.height / 4)
            HStack (spacing: 20){
                Button {
                    
                } label: {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(Color.white)
                }
                
                Text("10")
                    .foregroundStyle(Color.gray)
                
                Button {
                    
                } label: {
                    Image(systemName: "hand.thumbsdown.fill")
                        .foregroundStyle(Color.white)
                        
                }
                
                Text("10")
                    .foregroundStyle(Color.gray)
                Spacer()
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            
        }
        .background(
            RoundedRectangle(cornerRadius: 18)
                .inset(by: 1)
                .stroke(.white.opacity(0.1), lineWidth: 1)
        )
        .background(LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.05, green: 0.21, blue: 0.19), location: 0.00),
                Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.05), location: 1.00),
            ],
            startPoint: UnitPoint(x: 1, y: 1),
            endPoint: UnitPoint(x: 0, y: 0)).cornerRadius(18))
    }
}

#Preview {
    PublicationCardView(creatorName: "Магомед", createdAt: "28.11.2023", text: "Сколько будет стоить Bitcoin (BTC) в 2024, 2025, 2026 и 2030 году? Ознакомьтесь с различными точками зрения о целевой цене проекта и уровне доверия, известными как рейтинг консенсуса, при выборе собственной целевой цены. Информация основана на пользовательских данных, а не на мнении Binance. Готовы купить BTC? Binance поддерживает различные криптовалюты. Вы можете легко купить любую из них с помощью долларов США, евро, юаней, австралийских долларов, индийских рупий и других фиатных валют. Ознакомьтесь с руководством по покупке всех доступных токенов на Binance.1")
}
