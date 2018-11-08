//
//  WeatherEndPoint.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/4/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation

struct weatherAPI {
    
    let session = URLSession.shared
    var lati:String
    var longi:String
    var city:String
    var state:String
    let mainView = MainWeatherView()
    
    init(lati:String, longi:String, city:String, state:String) {
        self.lati = lati
        self.longi = longi
        self.city = city
        self.state = state
    }
    
    
     func setupAPI() {
        let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lati)&lon=\(longi)&units=imperial&APPID=01dfd7a79576fd7292bef57bfb4c1923")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                            if let temperature = mainDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    let multiplier = pow(10.0, 2.0)
                                    let roundedTemp = round(temperature as! Double * multiplier) / multiplier
                                    let correctTemp = lroundl(Float80(roundedTemp))
                                    //print(roundedTemp)
                                   // self.weatherView.cityNameLabel.text = "\(city), \(state)"
                                    print(correctTemp)
                                    self.mainView.weatherTextView.text = "hi)"
                                }
                            }
                        }
                        if let mainDictionary = jsonObj!.value(forKey: "sys") as? NSDictionary {
                            if let sunriseTime = mainDictionary.value(forKey: "sunrise") {
                                DispatchQueue.main.async {
                                    print(sunriseTime)
                                    let sunTime = sunriseTime as! Double
                                    let date = Date(timeIntervalSince1970: (sunTime / 1000.0))
                                    print("date - \(date)")
                                }
                            }
                        } else {
                            print("Error: unable to find temperature in dictionary")
                        }
                    } else {
                        print("Error: unable to convert json data")
                    }
                } else {
                    print("Error: did not receive data")
                }
            }
        }
        dataTask.resume()
    }
}
