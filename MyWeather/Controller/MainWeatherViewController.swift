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
    let cardOptions = CardOptionView()
    var hideOrshow = false
    let topMenu = TopMenuMainView()
    let weatherView = MainWeatherView()
    let bottomView = BottomSwipeUpView()
    let moreInfo = MoreWeatherDataView()
    let Locmanager = CLLocationManager()
    let upSwipe = UISwipeGestureRecognizer.Direction.up
    let downSwipe = UISwipeGestureRecognizer.Direction.down
    var showMoreWeather:UISwipeGestureRecognizer?
    var hideMoreInfo:UISwipeGestureRecognizer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViewController()
        addSwipes()
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
        
        print("My location = \(locationValue.latitude)\(locationValue.longitude)")
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
                    
                    let setWeatherInfo:(WeatherResponse) -> Void = { currentWeather in
                        DispatchQueue.main.async {
                            self.weatherView.weatherTextView.text = "\(Int(round(currentWeather.main.currentTemperature)))°"
                            self.moreInfo.minWeather.text = "Min temp: \(Int(round(currentWeather.main.minTemperature)))°"
                            self.moreInfo.maxWeather.text = "Max temp: \(Int(round(currentWeather.main.maxTemperature)))°"
                            self.moreInfo.humidity.text = "Humidity: \(currentWeather.main.humidity)%"
                            self.moreInfo.airPressure.text = "Pressure: \(currentWeather.main.pressure) hpa"
                        }
                    }
                    
                    let apiWeather = WeatherAPI()
                    self.weatherView.cityNameLabel.text = "\(cityname), \(statename)"
                    apiWeather.setupAPI(longitude: long, latitude: lat, oncompletion: setWeatherInfo)
                }
            }
        }
    }
    
    func setupViewController() {
        view.addSubview(weatherView)
        view.addSubview(topMenu)
        view.addSubview(cardOptions)
        view.addSubview(bottomView)
        view.addSubview(moreInfo)
        
        topMenu.infoButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        cardOptions.cameraButton.addTarget(self, action: #selector(presentCamerView), for: .touchUpInside)
        
        cardOptions.translatesAutoresizingMaskIntoConstraints = false
        topMenu.translatesAutoresizingMaskIntoConstraints = false
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        moreInfo.translatesAutoresizingMaskIntoConstraints = false
        
        bottomConstraint = cardOptions.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        swipeBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        swipeMoreWeather = moreInfo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        
        bottomConstraint?.isActive = true
        cardOptions.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        cardOptions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardOptions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
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
        moreInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moreInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        moreInfo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    func addSwipes() {
        showMoreWeather = UISwipeGestureRecognizer(target: self, action: #selector(presentMoreWeatherData))
        showMoreWeather?.direction = upSwipe
        hideMoreInfo = UISwipeGestureRecognizer(target: self, action: #selector(hideWeatherInfo))
        hideMoreInfo?.direction = downSwipe
        view.addGestureRecognizer(showMoreWeather!)
        view.addGestureRecognizer(hideMoreInfo!)
    }
    
    @objc func presentMoreWeatherData() {
        swipeMoreWeather?.constant = -10
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
    
    @objc func presentCamerView() {
        bottomConstraint?.constant = 600
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = false
        }, completion: nil)
        
    }
    
}

