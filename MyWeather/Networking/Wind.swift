//
//  Wind.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 12/1/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct Wind: Codable {
    enum  CodingKeys: String, CodingKey{
        case speed
        case degree = "deg"
    }
    var speed: Double
    var degree: Double
}
