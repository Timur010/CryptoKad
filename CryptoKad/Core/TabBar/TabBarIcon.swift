//
//  TabBarIcon.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct TabBarIcon: View {
    var tab: Tab
    @Binding var currentTab: Tab
    
    var body: some View {
        VStack {
            Image(tab.icon)
                .resizable()
                .foregroundStyle(Color.white)
        }
        .scaleEffect(0.5)
        .frame(width: currentTab == tab ? 70: 60, height: currentTab == tab ? 70: 60)
        .background(currentTab == tab ? Color.accentColor: .tabColor)
        .cornerRadius(28)
        .padding(.bottom, currentTab == tab ? 5: 0 )
        .onTapGesture {
            withAnimation {
                currentTab = tab
            }
        }
    }
}

#Preview {
    TabBarIcon(tab: .home, currentTab: .constant(.home))
}
