//
//  Endpoint.swift
//  CryptoKad
//
//  Created by Timur Kadiev on 27.11.2023.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var parameters: [String: Any]? { get }
}
