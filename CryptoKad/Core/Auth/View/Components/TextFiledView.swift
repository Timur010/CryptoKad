//
//  TextFiledView.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 25.11.2023.
//

import SwiftUI

struct TextFiledView: View {
    var title: String
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text )
            .foregroundStyle(Color.white)
            .padding()
            .background(Color.textFildeColor.opacity(0.4).cornerRadius(15))
            .disableAutocorrection(true)
    }
}

#Preview {
    TextFiledView(title: "Enter name", text: .constant(""))
}
