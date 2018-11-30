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
    var weather: [[String:Int]] = []
    let main: [String: Double]
    let wind: [String: Double]
    let sys: [String: Double]?
    let humidity: Int
    let visibility: Int


}
