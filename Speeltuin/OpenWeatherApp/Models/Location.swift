//
//  Location.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//
// This file was generated from JSON Schema using https://app.quicktype.io, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let Location = try? JSONDecoder().decode(Location.self, from: jsonData)

import Foundation

// MARK: - Location

struct Location: Decodable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}
 
