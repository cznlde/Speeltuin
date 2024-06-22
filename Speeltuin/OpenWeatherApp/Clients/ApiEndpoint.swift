//
//  ApiEndpoint.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

import Foundation
enum ApiEndpoint {
    static let baseUrl = "https://api.openweathermap.org"

    case coordinateByLocation(String)
    case weaterByLocation(Double, Double)

    var path: String {
        switch self {
        case let .coordinateByLocation(city):
            return "/geo/1.0/direct?q=\(city)&limit=5&appid=\(Config.OpenWeaterAppApiKey)"
        case let .weaterByLocation(lat, lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Config.OpenWeaterAppApiKey)"
        }
    }

    static func endpointURL(for endpoint: ApiEndpoint) -> URL {
        return URL(string: "\(baseUrl)\(endpoint.path)")!
    }
}
