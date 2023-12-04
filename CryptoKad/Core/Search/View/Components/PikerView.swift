//
//  PikerView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 03.12.2023.
//

import SwiftUI

struct PikerView: View {
    @EnvironmentObject private var vm: SearchViewModel
    @State private var currentIndex: Int = 0
    
    private func itemWidth(availableWidth: CGFloat) -> CGFloat {
        (availableWidth / CGFloat(2) - 2)
    }
    
    private func xOffsetForSelection(availableWidth: CGFloat) -> CGFloat {
        itemWidth(availableWidth: availableWidth) * CGFloat(currentIndex)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Color.fieldColor.cornerRadius(20)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.mainColor.opacity(1))
                    .frame(
                        width: itemWidth(availableWidth: proxy.size.width),
                        height: proxy.size.height
                    )
                    .offset(x: xOffsetForSelection(availableWidth: proxy.size.width))
                    .padding(2)
                    .shadow(color: .white.opacity(0.15), radius: 5, x: 0, y: 2)
                
                HStack {
                    ForEach(Array(SearchEnum.allCases.enumerated()), id: \.element) { i, element in
                        Text(element.string)
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation (.easeInOut(duration: 0.2)) {
                                    currentIndex = i
                                    vm.current = element
                                    Task {
                                        await vm.search()
                                    }
                                }
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(height: 35)
    }
}

#Preview {
    PikerView()
}
