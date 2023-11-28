//
//  HomeView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 26.11.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel(homeDataService: HomeDataService.homeDataService)
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack (spacing: 0) {
                HStack{}
                    .frame(width: UIScreen.main.bounds.width, height: 40)
                    .background(LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.05, green: 0.21, blue: 0.19), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.05), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 1, y: 1),
                        endPoint: UnitPoint(x: 0, y: 0))
                    )
                Heder(image: "btc", name: "Bitcion", status: true, dataPoints: vm.btc)
                Heder(image: "ethere", name: "Etherium", status: false, dataPoints: vm.ethere)
                Heder(image: "usdt", name: "Usdt", status: true, dataPoints: vm.usdt)
            }
            HStack {
                Text("Публикации")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                    .bold()
                Spacer()
                Button {
                    
                } label: {
                    Text("Сортировать")
                        .foregroundStyle(Color.white.opacity(0.5))
                        .font(.subheadline)
                        .bold()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(Color.white.opacity(0.5))
                }
            }
            .padding()
            
            ForEach(vm.tweets, id: \.self) { tweets in
                PublicationCardView(creatorName: tweets.username, createdAt: tweets.createdAt, text: tweets.text)
                    .padding(5)
            }
            Spacer(minLength: 150)
        }
        .onAppear {
            Task {
                await vm.fetchTwetts()
            }
        }
        .ignoresSafeArea()
        .background(Color.black)
    }
}

#Preview {
    HomeView()
}
