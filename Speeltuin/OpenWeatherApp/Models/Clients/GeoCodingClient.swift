//
//  GeoCodingClient.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

import Foundation


struct GeoCodingClient {
    func coordinateByCity(city: String) async throws -> Location? {
        let url = ApiEndpoint.endpointURL(for: .coordinateByLocation(city))
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
    }
}
