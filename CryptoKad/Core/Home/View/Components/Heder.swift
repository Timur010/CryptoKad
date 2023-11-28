//
//  Heder.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import SwiftUI

struct Heder: View {
    var image: String
    var name: String
    var status: Bool
    let dataPoints: [Double]
    var body: some View {
        VStack {
            HStack (spacing: 10) {
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(name)
                    .foregroundStyle(Color.white)
                LineChart(dataPoints: dataPoints)
                    .frame( height: 20)
                    .aspectRatio(contentMode: .fill)
                    .padding()
                Text("+ 38 432")
                    .foregroundStyle(status ? Color.green : Color.red)
            }
            .padding()
        }
        .background(status ? LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.05, green: 0.21, blue: 0.19), location: 0.00),
                Gradient.Stop(color: Color(red: 0.05, green: 0.05, blue: 0.05), location: 1.00),
            ],
            startPoint: UnitPoint(x: 1, y: 1),
            endPoint: UnitPoint(x: 0, y: 0)
        ) : 
                        LinearGradient(colors: [.darcRed, .cardDarcGradientColor], startPoint: .bottomTrailing, endPoint: .topLeading
                          )
        )
    }
}

#Preview {
    Heder(image: "ether", name: "etherium", status: true, dataPoints: [12.00, 15.135, 345.90, 14975.00, 19765.00, 34976.65, 12987.00, 1456.00, 64987.00, 12000.000, 12.00, 15.135, 345.90, 14975.00, 19765.00, 34976.65, 12987.00, 1456.00, 64987.00, 12000.000])
}
