//
//  ViewController.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/18/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class MainWeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    var bottomConstraint:NSLayoutConstraint?
    var swipeBottomConstraint:NSLayoutConstraint?
    var swipeMoreWeather:NSLayoutConstraint?
    var quickWeatherHeight:NSLayoutConstraint?
    var quickWeatherWidth:NSLayoutConstraint?
    var backgroundHeight:NSLayoutConstraint?
    var backgroundWidth:NSLayoutConstraint?
    let cardOptions = CardOptionView()
    var hideOrshow = false
    let apiWeather = WeatherAPI()
    let topMenu = TopMenuMainView()
    let weatherView = MainWeatherView()
    let bottomView = BottomSwipeUpView()
    let moreInfo = MoreWeatherDataView()
    let quickWeatherView = QuickWeatherView()
    let Locmanager = CLLocationManager()
    let upSwipe = UISwipeGestureRecognizer.Direction.up
    let downSwipe = UISwipeGestureRecognizer.Direction.down
    var showMoreWeather:UISwipeGestureRecognizer?
    var hideMoreInfo:UISwipeGestureRecognizer?
    var returnNormal:UITapGestureRecognizer?
    
    var imageIcon:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var backgroundView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.314, green: 0.475, blue: 0.969, alpha: 1.00)
        setupViewController()
        addSwipesAndTaps()
        self.Locmanager.requestAlwaysAuthorization()
        self.Locmanager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            Locmanager.delegate = self
            Locmanager.desiredAccuracy = kCLLocationAccuracyBest
            Locmanager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationValue : CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        
        print("My location: \(locationValue.latitude)\(locationValue.longitude)")
        let lat = String(locationValue.latitude)
        let long = String(locationValue.longitude)
        
        CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
            if error != nil {
                print("Error")
            }
            else {
                if let place = placemark?[0] {
                    guard let cityname = place.locality, let statename = place.administrativeArea else {
                        return
                    }
                    
                    let setWeatherIconImage:(UIImage) -> Void = { iconImage in
                        DispatchQueue.main.async {
                            self.imageIcon.image = iconImage
                        }
                    }
                    
                    let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                        print(currentWeather.main.currentTemperature)
                        let icon = currentWeather.weather[0].icon
                        self.apiWeather.getWeatherImage(iconName: icon, onCompletion: setWeatherIconImage)
                        DispatchQueue.main.async {
                            self.displayWeatherInfo(currentWeather: currentWeather)
                        }
                    }
                    
                    self.weatherView.cityNameLabel.text = "\(cityname), \(statename)"
                    self.apiWeather.weatherInfo(longitude: long, latitude: lat, onCompletion: setWeatherInfo)
                }
            }
        }
    }
    
    func setupViewController() {
        view.addSubview(backgroundView)
        view.addSubview(imageIcon)
        view.addSubview(weatherView)
        view.addSubview(topMenu)
        view.addSubview(cardOptions)
        view.addSubview(bottomView)
        view.addSubview(moreInfo)
        view.addSubview(quickWeatherView)
        
        topMenu.infoButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        cardOptions.quickWeatherButton.addTarget(self, action: #selector(presentQuickWeaterView), for: .touchUpInside)
        quickWeatherView.searchButton.addTarget(self, action: #selector(showQuickWeather), for: .touchUpInside)
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        cardOptions.translatesAutoresizingMaskIntoConstraints = false
        topMenu.translatesAutoresizingMaskIntoConstraints = false
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        moreInfo.translatesAutoresizingMaskIntoConstraints = false
        quickWeatherView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomConstraint = cardOptions.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        swipeBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        swipeMoreWeather = moreInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        quickWeatherHeight = quickWeatherView.heightAnchor.constraint(equalToConstant: 0)
        quickWeatherWidth = quickWeatherView.widthAnchor.constraint(equalToConstant: 0)
        backgroundHeight = backgroundView.heightAnchor.constraint(equalToConstant: 0)
        backgroundWidth = backgroundView.widthAnchor.constraint(equalToConstant: 0)
        
        backgroundHeight?.isActive = true
        backgroundWidth?.isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bottomConstraint?.isActive = true
        cardOptions.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        cardOptions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardOptions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageIcon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true
        
        topMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topMenu.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        weatherView.topAnchor.constraint(equalTo: topMenu.bottomAnchor, constant: 10).isActive = true
        weatherView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        weatherView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        weatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        swipeBottomConstraint?.isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        swipeMoreWeather?.isActive = true
        moreInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        moreInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        moreInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        quickWeatherHeight?.isActive = true
        quickWeatherWidth?.isActive = true
        quickWeatherView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quickWeatherView.topAnchor.constraint(equalTo: topMenu.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func displayWeatherInfo(currentWeather: WeatherResponse) {
            let currentTemp = currentWeather.main.currentTemperature
                weatherView.weatherTextView.text = "\(Int(round(currentTemp)))°"
            let minTemp = currentWeather.main.minTemperature
                moreInfo.minWeather.text = "Min temp: \(Int(round(minTemp)))°"
            let maxTemp = currentWeather.main.maxTemperature
                moreInfo.maxWeather.text = "Max temp: \(Int(round(maxTemp)))°"
            let humidity = currentWeather.main.humidity
                moreInfo.humidity.text = "Humidity: \(humidity)%"
            let pressure = currentWeather.main.pressure
                moreInfo.airPressure.text = "Pressure: \(pressure) hpa"
            let windSpeed = currentWeather.wind.speed
                moreInfo.windSpeed.text = "Wind Speed: \(Int(round(windSpeed)))m/h"
            let deg = currentWeather.wind.degree
                moreInfo.windDegree.text = "Wind Degree: \(Int(round(deg)))"
            let descip = currentWeather.weather[0].description
                moreInfo.descriptionWeather.text = descip.capitalized
            let sunset = currentWeather.time.sunset
            let sunsetTime = sunsetSunriseTimeSet(convertTime: Double(sunset))
                moreInfo.sunset.text = "Sunset: \(sunsetTime)"
            let sunrise = currentWeather.time.sunrise
            let sunriseTime = sunsetSunriseTimeSet(convertTime: Double(sunrise))
                moreInfo.sunrise.text = "Sunrise: \(sunriseTime)"
    }
    
    func addSwipesAndTaps() {
        showMoreWeather = UISwipeGestureRecognizer(target: self, action: #selector(presentMoreWeatherData))
        showMoreWeather?.direction = upSwipe
        hideMoreInfo = UISwipeGestureRecognizer(target: self, action: #selector(hideWeatherInfo))
        hideMoreInfo?.direction = downSwipe
        returnNormal = UITapGestureRecognizer(target: self, action: #selector(returnToNormal))
        returnNormal?.numberOfTapsRequired = 1
        backgroundView.addGestureRecognizer(returnNormal!)
        view.addGestureRecognizer(showMoreWeather!)
        view.addGestureRecognizer(hideMoreInfo!)
    }
    
    func sunsetSunriseTimeSet(convertTime: Double) -> String {
        let sunsetDate = Date(timeIntervalSince1970: Double(convertTime))
        let sunsetDateFormatter = DateFormatter()
        sunsetDateFormatter.timeZone = TimeZone(abbreviation: "UTC/GMT") //Set timezone that you want
        sunsetDateFormatter.locale = NSLocale.current
        sunsetDateFormatter.dateFormat = "HH:mm" //Specify your format that you want
        let sunsetData = sunsetDateFormatter.string(from: sunsetDate)
        return sunsetData
    }
    
    @objc func presentMoreWeatherData() {
        returnToNormal()
        swipeMoreWeather?.constant = -20
        swipeBottomConstraint?.constant = 200
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func hideWeatherInfo() {
        swipeMoreWeather?.constant = 600
        swipeBottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func dissmissCard() {
        if hideOrshow {
            bottomConstraint?.constant = 600
            swipeBottomConstraint?.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                self.hideOrshow = false
            }, completion: nil)
        }
    }
    
    @objc func animateCard() {
        if hideOrshow {
            returnToNormal()
            bottomConstraint?.constant = 600
            swipeBottomConstraint?.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                self.hideOrshow = false
            }, completion: nil)
        } else {
        bottomConstraint?.constant = -10
        swipeBottomConstraint?.constant = 200
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = true
            }, completion: nil)
        }
    }
    
    @objc func presentQuickWeaterView() {
        returnToNormal()
        backgroundWidth?.constant = 2000
        backgroundHeight?.constant = 2000
        quickWeatherHeight?.constant = 350
        quickWeatherWidth?.constant = 350
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = false
        }, completion: nil)
    }
    
    @objc func showQuickWeather() {
        let cityName = quickWeatherView.searchBarTextField.text
        let city = cityName?.replacingOccurrences(of: " ", with: "%20")
        print(city as Any)
        let setWeatherIconImage:(UIImage) -> Void = { iconImage in
            DispatchQueue.main.async {
                //self.imageIcon.image = iconImage
            }
        }
        
        let setWeatherInfoWithCity:(WeatherResponse) -> Void = { currentWeather in
            let icon = currentWeather.weather[0].icon
                self.apiWeather.getWeatherImage(iconName: icon, onCompletion: setWeatherIconImage)
            DispatchQueue.main.async {
                self.quickWeatherView.showQuickMainWeather.text = "\(currentWeather.main.currentTemperature)"
            }
        }
        self.apiWeather.weatherInfowithCity(cityName: city!, onCompletion: setWeatherInfoWithCity)
    }
    
    @objc func returnToNormal() {
        backgroundWidth?.constant = 0
        backgroundHeight?.constant = 0
        bottomConstraint?.constant = 600
        swipeBottomConstraint?.constant = 0
        quickWeatherHeight?.constant = 0
        quickWeatherWidth?.constant = 0
        swipeMoreWeather?.constant = 600
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = true
        }, completion: nil)
    }
    
}
