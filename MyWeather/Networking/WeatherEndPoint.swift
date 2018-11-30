//
//  WeatherEndPoint.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/4/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

final class WeatherAPI {
    
    let session = URLSession.shared
    let lat:String
    let long:String
    let weatherURL:String
    var urlDetails:String
    
    
    
    init(lati:String, longi:String) {
        self.lat = lati
        self.long = longi
        weatherURL = "https://api.openweathermap.org"
        urlDetails = "/data/2.5/weather?lat=\(self.lat)&lon=\(self.long)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923"
    }
    
    func setupAPI(oncompletion: @escaping (Weather) -> Void) {
        guard let url = URL(string: weatherURL + urlDetails) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let weather = try
                                JSONDecoder().decode(Weather.self, from: data)
                oncompletion(weather)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }

}
