//
//  CategoryEnum.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 03.12.2023.
//

import Foundation

enum CategoryEnum {
    case crypto, bitc, avto, blokchain, none
    
    var string: String {
        switch self {
        case .crypto:
            return "Crypto"
        case .bitc:
            return "Bitc"
        case .avto:
            return "Avto"
        case .blokchain:
            return "Blokchain"
        case .none:
            return ""
        }
    }
}
