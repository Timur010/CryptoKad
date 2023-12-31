//
//  RequestEncoder.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

class RequestEncoder {
    static func json(parameters: [String: Any]) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            print(error)
            return nil
        }
    }
}
