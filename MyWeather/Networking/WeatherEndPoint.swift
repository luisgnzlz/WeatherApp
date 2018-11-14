//
//  WeatherEndPoint.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/4/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

final class weatherAPI {
    
    let session = URLSession.shared
    var lati:String
    var longi:String
    var city:String
    var state:String
    var weatherURL:URL
    
    init(lati:String, longi:String, city:String, state:String) {
        self.lati = lati
        self.longi = longi
        self.city = city
        self.state = state
        self.weatherURL = (URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(self.lati)&lon=\(self.longi)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923"))!
        setupAPI()
    }
    
     func setupAPI() {
        URLSession.shared.dataTask(with: weatherURL) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                let weather = try
                                JSONDecoder().decode(Weather.self, from: data)
                print(weather.main["temp"] as Any)
            } catch let jsonErr {
                print(jsonErr)
            }
            let dataString = String(data: data, encoding: .utf8)
            print(dataString as Any)
        }.resume()
    }
}
