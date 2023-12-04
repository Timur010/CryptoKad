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
                hederGradient
                Heder(image: "btc", name: "Bitcion", status: true, dataPoints: vm.btc)
                Heder(image: "ethere", name: "Etherium", status: false, dataPoints: vm.ethere)
                Heder(image: "usdt", name: "Usdt", status: true, dataPoints: vm.usdt)
            }
            
            profil
//                .overlay(content: {
//                    GeometryReader { geometry in
//                        VStack (alignment: .leading) {
//                                TextEditor(text: $vm.text)
//                                    .colorMultiply(.white).cornerRadius(10)
//                                Button {
//                                   
//                                } label: {
//                                    Text("Category")
//                                        .foregroundStyle(Color.black)
//                                }
////                            Picker("выберите категорию", selection: $vm.currentCategory) {
////                                Text("crypto").tag(CategoryEnum.crypto)
////                                Text("avto").tag(CategoryEnum.avto)
////                                Text("bitc").tag(CategoryEnum.bitc)
////                                Text("blokchain").tag(CategoryEnum.blokchain)
////                            }
////                            .pickerStyle(MenuPickerStyle())
//
//                            }
//                            .padding(10)
//                            .frame(width: UIScreen.main.bounds.width - 20, height: 200)
//                            .background(Color.gray.cornerRadius(10))
//                            .offset(x: vm.isPopap ? geometry.size.width : 10 )
//                            .animation(.interpolatingSpring(stiffness: 70, damping: 10), value: vm.isPopap)
//                        }
//                })
//                .zIndex(1)
            
            delimiter
            
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
        .background(Color.black)
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var hederGradient: some View {
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
    }
    private var delimiter: some View {
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
    }
    private var profil: some View {
        HStack (alignment: .bottom) {
            VStack {
                Button {
                    //                    withAnimation {
                    vm.isPopap = false
                    //                    }
                } label: {
                    Image(systemName:"gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                }
                Spacer()
                Text("Подписчики: 12")
                    .foregroundStyle(Color.white)
            }
            
            
            Spacer()
            
            VStack {
                Image("mokImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .contentShape(Circle())
                    .frame(width: 70, height: 70)
                
                Text("Timur")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                    .bold()
            }
            .padding(.trailing, 37)
            
            Spacer()
            
            VStack {
                Button {
                    //                    withAnimation  {
                    vm.isPopap = true
                    //                    }
                    
                } label: {
                    Image(systemName:"plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                }
                Spacer()
                Text("посты: 5")
                    .foregroundStyle(Color.white)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .inset(by: 1)
                .stroke(.white.opacity(0.3), lineWidth: 1)
        )
    }
}
