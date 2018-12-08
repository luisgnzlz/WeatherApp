//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/13/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    var main: Weather
    var wind: Wind
    var weather: [Description]
    var sys: TimeWeather
}
