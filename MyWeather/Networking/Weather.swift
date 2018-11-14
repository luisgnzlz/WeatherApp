//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/13/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let coord: [String: Double]
    let main: [String: Double]

}
