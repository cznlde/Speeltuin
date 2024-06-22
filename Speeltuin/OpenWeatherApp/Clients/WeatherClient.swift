//
//  WeatherClient.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

import Foundation

struct WeatherClient {
    func fetchWeather(location: Location) async throws -> WeatherResponse {
        do {
            let (data, response) = try await URLSession.shared.data(from: ApiEndpoint.endpointURL(for: .weaterByLocation(location.lat, location.lon)))
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            do {
                
                guard let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
                    throw NetworkError.custom("No weather data available")
                }
                return weatherResponse
            } catch {
                throw NetworkError.decodingError(error)
            }
        } catch {
            throw NetworkError.custom("Network request failed: \(error.localizedDescription)")
        }
    }
}

