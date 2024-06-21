//
//  Constants.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

import Foundation
enum NetworkError: Error {
    case invalidResponse
    case decodingError(Error)
    case custom(String)
}
