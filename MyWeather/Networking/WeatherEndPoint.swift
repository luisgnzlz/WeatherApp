//
//  WeatherEndPoint.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/4/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation
import UIKit

final class WeatherAPI {
    let session = URLSession.shared
    let baseUrl = "https://api.openweathermap.org"

    func weatherInfo(longitude: String, latitude: String, onCompletion: @escaping (WeatherResponse) -> Void) {
        let urlDetails = "/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923"
        guard let url = URL(string: baseUrl + urlDetails) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let weather = try
                                JSONDecoder().decode(WeatherResponse.self, from: data)
                onCompletion(weather)
            } catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    func weatherInfowithCity(cityName: String, onCompletion: @escaping (WeatherResponse) -> Void) {
        let urlDetails = "/data/2.5/weather?q=\(cityName)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923"
        guard let url = URL(string: baseUrl + urlDetails) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let weather = try
                    JSONDecoder().decode(WeatherResponse.self, from: data)
                onCompletion(weather)
            } catch let jsonErr {
                print(jsonErr)
            }
            }.resume()
    }

    func getWeatherImage(iconName:String, onCompletion: @escaping (UIImage) -> Void) {
        let urlDetails = "https://openweathermap.org/img/w/"+iconName+".png"
        guard let url = URL(string:urlDetails) else { return }
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
                guard let iconImage = UIImage(data: data) else {return}
                onCompletion(iconImage)
        }.resume()
    }
}

func getWeekWeather(longitude: String, latitude: String, onCompletion: @escaping (WeatherResponse) -> Void) {
    
}
