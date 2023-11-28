//
//  TabBarView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var store: Store
    var body: some View {
        ZStack(alignment: .bottom) {
            tabBarView
            tabBarIcon
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TabBarView()
        .environmentObject(Store())
}

extension TabBarView {
    private var tabBarView: some View {
        TabView (selection: $store.currenTab){
            HomeView()
                .tag(Tab.home)
                .navigationBarHidden(true)
            SearchView()
                .tag(Tab.searh)
                .navigationBarHidden(true)
            Text("Wallet")
                .tag(Tab.wallet)
                .navigationBarHidden(true)
            AccountView()
                .tag(Tab.account)
                .navigationBarHidden(true)
                .environmentObject(store)
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .black
        }
    }
    private var tabBarIcon: some View {
        HStack(alignment: .center, spacing: 40) {
            ForEach(Tab.allCases, id: \.self) { tab in
                TabBarIcon(tab: tab, currentTab: $store.currenTab)
            }
            .padding(.bottom, 58)
            .padding(.top, 10)
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.tabColor.cornerRadius(40).shadow(radius: 1))
        .offset(y: 40)
    }
}
