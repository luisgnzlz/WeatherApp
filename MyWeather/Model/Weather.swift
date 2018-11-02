//
//  Weather.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/18/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct Weather {
    let description:String
    let icon:String
    let temperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    static let basePath = "api.openweathermap.org/data/2.5/forecast?id=524901&APPID=01dfd7a79576fd7292bef57bfb4c1923"
    
    guard let 
    
    
    
}
