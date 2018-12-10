//
//  Description.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 12/1/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct WeatherDescription: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case shortHand = "main"
        case description
        case icon
    }
    var id: Int
    var shortHand: String
    var description: String
    var icon: String
}
