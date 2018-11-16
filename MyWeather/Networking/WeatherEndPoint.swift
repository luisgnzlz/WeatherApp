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
    let lat:String
    let long:String
    var weatherURL:URL
    
    init(lati:String, longi:String) {
        self.lat = lati
        self.long = longi
        weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(self.lat)&lon=\(self.long)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923")!
    }
    
    func setupAPI(oncompletion: @escaping (Weather) -> Void) {
        session.dataTask(with: weatherURL) { (data, response, err) in
            guard let data = data else { return }
            do {
                let weather = try
                                JSONDecoder().decode(Weather.self, from: data)
                guard let trueWeather = weather.main["temp"] else { return }
                oncompletion(weather)
                print(trueWeather)
            } catch let jsonErr {
                print(jsonErr)
            }
            let dataString = String(data: data, encoding: .utf8)
            print(dataString as Any)
        }.resume()
    }

}
