//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/29/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct Weather: Codable {
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case pressure, humidity
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
    var currentTemperature: Double
    var pressure: Int
    var humidity: Int
    var minTemperature: Double
    var maxTemperature: Double
}
