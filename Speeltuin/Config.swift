 
//
//  Config.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 16.06.24.
//

 
import Foundation

// om wijzigingen niet meer in github pushen
// git update-index --assume-unchanged Config.swift

// om dit bestand te kunnen comitten
// git update-index --no-assume-unchanged Config.swift

struct Config {
    // Add your OpenWeather API key here.
    // Replace 'YOUR_API_KEY_HERE' with your actual API key.
    // This key is necessary to authenticate requests to the OpenWeather API.
    // For more information on how to get your API key, visit:
    // https://home.openweathermap.org/users/sign_up
    static let OpenWeaterAppApiKey = "YOUR_API_KEY_HERE"
    //https://platform.openai.com/signup
    static let OpenAIAppApiKey = "YOUR_API_KEY_HERE"
  
}
