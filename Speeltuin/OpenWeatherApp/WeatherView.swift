//
//  Weather.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

// View
import SwiftUI

struct WeatherView: View, TopicProvidable {
    @State private var cityName = ""
    @State private var isFetchingWeather = false
    @State private var weatherResponse: WeatherResponse?
    let topic = Topic(name: "WeatherApp", description: "Using Web API and MV Pattern. Consuming JSON", image: "sun.rain.fill")
    let geocodingClient = GeoCodingClient()
    let weatherClient = WeatherClient()
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city: cityName) else {
                print("Location not found")
                return
            }
            weatherResponse = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                TextField("Enter city name", text: $cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        // This is an old-fashioned way
                        // The task doesn't get closed when the view goes away. Therefore, nowadays we prefer using a task closure.

//                        Task {
//                            await fetchWeather()
//                        }
                        isFetchingWeather = true
                    }.task(id: isFetchingWeather) {
                        if isFetchingWeather {
                            await fetchWeather()
                            isFetchingWeather = false
                            cityName = ""
                        }
                    }
                if let weatherResponse {
                    Text( MeasurementFormatter.temperature(value: weatherResponse.main.temp ))
                        .font(.system(size: 100))
                }
            }.padding()
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
