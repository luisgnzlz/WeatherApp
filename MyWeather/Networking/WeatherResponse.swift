//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/13/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
     enum  CodingKeys: String, CodingKey{
        case main
        case wind
        case weather
        case time = "sys"
    }
    var main: Weather
    var wind: Wind
    var weather: [WeatherDescription]
    var time: TimeWeather
}
