//
//  TimeWeather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 12/1/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct TimeWeather: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case id
        case message
        case country
        case sunrise
        case sunset
    }
    
    var type: Int
    var id: Int
    var message: Double
    var country: String
    var sunrise: Int
    var sunset: Int
    
}
