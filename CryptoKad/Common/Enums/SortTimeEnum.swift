//
//  SortTimeEnum.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 04.12.2023.
//

import Foundation

enum SortTimeEnum {
    case new, old
    
    var string: String {
        switch self {
        case .new:
            return "-1"
        case .old:
            return "1"
        }
    }
}
