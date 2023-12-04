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
            gradientHeder
            VStack {
                HStack(spacing: 0) {
                    TextField("Поиск пользователей", text: $viewModel.searchText, onEditingChanged: { changed in
                        if !changed {
                            Task {
                                await viewModel.search()
                            }
                        }
                    })
                    .frame(width: 100)
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
                    PikerView()
                        .environmentObject(viewModel)
                    Menu {
                        Section ("Категории") {
                            Button("Crypto") {
                                viewModel.category = .crypto
                                Task {
                                    await viewModel.search()
                                }
                            }
                            Button("Bitc") {
                                viewModel.category = .bitc
                                Task {
                                    await viewModel.search()
                                }
                            }
                            Button("blokchain") {
                                viewModel.category = .blokchain
                                Task {
                                    await viewModel.search()
                                }
                            }
                            Button("Avto") {
                                viewModel.category = .avto
                                Task {
                                    await viewModel.search()
                                }
                            }
                            Button("None") {
                                viewModel.category = .none
                                Task {
                                    await viewModel.search()
                                }
                            }
                        }
                        Section ("Сортировка по времени") {
                            Button("Новые") {
                                viewModel.sortTime = .new
                                Task {
                                    await viewModel.search()
                                }
                            }
                            Button("Старые") {
                                viewModel.sortTime = .old
                                Task {
                                    await viewModel.search()
                                }
                            }
                        }
                    } label: {
                        Image("filters")
                            .foregroundStyle(Color.white)
                    }
                }
                .padding(10)
                Divider()
                
                ScrollView {
                    ForEach(viewModel.tweets, id: \.self) { tweets in
                        PublicationCardView(creatorName: tweets.username, createdAt: tweets.createdAt, text: tweets.text)
//                        UserProfileCard(name: user.name ?? "")
                            .padding()
                    }
                }
                .zIndex(1)
                
            }
        }
    }
}

#Preview {
    SearchView()
}

extension SearchView {
    private var gradientHeder: some View {
        RadialGradient(
            gradient:
                Gradient(stops: [Gradient.Stop(color: .accentColor.opacity(0.8), location: 0.0),
                                 Gradient.Stop(color: Color.clear, location: 1.0)]), center: UnitPoint.top, startRadius: 0.0, endRadius: 150).ignoresSafeArea()
    }
}
