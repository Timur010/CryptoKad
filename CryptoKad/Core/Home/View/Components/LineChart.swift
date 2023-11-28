//
//  LineChart.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import SwiftUI

struct LineChart: View {
    let dataPoints: [Double]

       var body: some View {
           GeometryReader { geometry in
               Path { path in
                   for i in 0..<dataPoints.count {
                       let x = geometry.size.width / CGFloat(dataPoints.count - 1) * CGFloat(i)
                       let y = geometry.size.height * CGFloat(1 - dataPoints[i] / 60000) // Обновленная нормализация
                       if i == 0 {
                           path.move(to: CGPoint(x: x, y: y))
                       } else {
                           path.addLine(to: CGPoint(x: x, y: y))
                       }
                   }
               }
               .stroke(Color.orange, lineWidth: 2)
           }
       }
}

#Preview {
    LineChart(dataPoints: (0..<30).map { _ in Double.random(in: 50000...60000) })
}
