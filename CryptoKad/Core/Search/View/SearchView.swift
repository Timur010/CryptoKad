//
//  SearchView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel(searchDataService: SearchDataService.searchDataService)
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            RadialGradient(
                gradient:
                    Gradient(stops: [Gradient.Stop(color: .accentColor.opacity(0.8), location: 0.0),
                                     Gradient.Stop(color: Color.clear, location: 1.0)]), center: UnitPoint.top, startRadius: 0.0, endRadius: 150).ignoresSafeArea()
                VStack {
                    HStack(spacing: 20) {
                        TextField("Поиск пользователей", text: $viewModel.searchText, onEditingChanged: { changed in
                            if !changed {
                                Task {
                                    await viewModel.search()
                                }
                            }
                        })
                        .foregroundStyle(Color.white)
                        .padding(10)
                        .background(Color.fieldColor.cornerRadius(20))
                        .onReceive(timer) { _ in
                            if !viewModel.searchText.isEmpty {
                                Task {
                                    await viewModel.search()
                                }
                            }
                        }
                        Button {
                            
                        } label: {
                            Image("filters")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding()
                    Divider()
                    
                    ScrollView {
                        ForEach(viewModel.users, id: \.self) { user in
                            UserProfileCard(name: user.name ?? "")
                                .padding()
                        }
                        
            //            ForEach (0..<10, id: \.self) { i in
            //                PublicationCardView(creatorName: "Maujvtl", createdAt: "28.11.2023", text: "Сколько будет стоить Bitcoin (BTC) в 2024, 2025, 2026 и 2030 году? Ознакомьтесь с различными точками зрения о целевой цене проекта и уровне доверия, известными как рейтинг консенсуса, при выборе собственной целевой цены. Информация основана на пользовательских данных, а не на мнении Binance. Готовы купить BTC? Binance поддерживает различные криптовалюты. Вы можете легко купить любую из них с помощью долларов США, евро, юаней, австралийских долларов, индийских рупий и других фиатных валют. Ознакомьтесь с руководством по покупке всех доступных токенов на Binance.")
            //            }
                    }
                    
                }

//            .background(Color.mainColor)
        }
    }
}

#Preview {
    SearchView()
}
