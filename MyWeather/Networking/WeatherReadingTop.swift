//
//  WeatherReadingTop.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 5/11/19.
//  Copyright © 2019 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct WeatherReaderTop: Codable {
    enum  CodingKeys: String, CodingKey{
        case list
    }
    var list: [WeatherResponse]
}
