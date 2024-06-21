//
//  Weather.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 21.06.24.
//

// View
import SwiftUI

struct WeatherView: View, TopicProvidable {
    let topic = Topic(name: "WeatherApp", description: "Using Web API and MV Pattern. Consuming JSON", image: "sun.rain.fill")

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                Button("get cordinates") {
                    Task {
                        let geocodingClient = GeoCodingClient()
                        let location = try! await geocodingClient.coordinateByCity(city: "Rhede")
                       
                        print(location!.name)
                        let weatherClient = WeatherClient()
                        let weather = try! await weatherClient.fetchWeather(location: location!)
                        print(weather.description)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        WeatherView()
    }
}
