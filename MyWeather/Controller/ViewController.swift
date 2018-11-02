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

var bottomConstraint = NSLayoutConstraint()
var swipeBottomConstraint = NSLayoutConstraint()
let cardOptions = cardOptionView()
var cameraContr = cameraViewController()

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var hideOrshow = false
    let topMenu = topMenuMainView()
    let weatherView = mainWeatherView()
    let bottomView = BottomSwipeUpView()
    let camerView = cameraViewController()
    var swipedirection = UISwipeGestureRecognizer.Direction.down
    let Locmanager = CLLocationManager()
    var lat = ""
    var long = ""
    var city = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        
        view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(dissmissCard)))
        view.backgroundColor = .lightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        lat = String(locationValue.latitude)
        long = String(locationValue.longitude)
        
        CLGeocoder().reverseGeocodeLocation(locations[0]) { (placemark, error) in
            if error != nil {
                print("Error")
            }
            else {
                if let place = placemark?[0] {
                    guard let cityname = place.locality, let statename = place.administrativeArea else {
                        return
                    }
                    self.setupAPI(lati: self.lat, longi: self.long, city: cityname, state: statename)
                }
            }
        }
    }
    
    func setupViewController() {
        view.addSubview(weatherView)
        view.addSubview(topMenu)
        view.addSubview(cardOptions)
        view.addSubview(bottomView)
        
        infoButton.addTarget(self, action: #selector(animateCard), for: .touchUpInside)
        cameraButton.addTarget(self, action: #selector(presentCamerView), for: .touchUpInside)
        
        cardOptions.translatesAutoresizingMaskIntoConstraints = false
        topMenu.translatesAutoresizingMaskIntoConstraints = false
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomConstraint = cardOptions.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 600)
        swipeBottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        
        bottomConstraint.isActive = true
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
        
        swipeBottomConstraint.isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupAPI(lati:String, longi:String, city: String, state: String) {
        let session = URLSession.shared
        let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lati)&lon=\(longi)&units=imperial&APPID={ID}")!
        print("\(weatherURL)")
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
                                    let correctTemp = lroundl(roundedTemp)
                                    print(roundedTemp)
                                    self.weatherView.weatherTextView.text = "\(correctTemp)°"
                                    self.weatherView.cityNameLabel.text = "\(city), \(state)"
                                }
                            }
                        }
                        if let mainDictionary = jsonObj!.value(forKey: "sys") as? NSDictionary {
                            if let sunriseTime = mainDictionary.value(forKey: "sunset") {
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
    
    @objc func dissmissCard() {
        if hideOrshow {
            bottomConstraint.constant = 600
            swipeBottomConstraint.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                self.hideOrshow = false
            }, completion: nil)
            }
    }
    
    @objc func animateCard() {
        if hideOrshow {
            bottomConstraint.constant = 600
            swipeBottomConstraint.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                self.hideOrshow = false
            }, completion: nil)
        } else {
        bottomConstraint.constant = -10
        swipeBottomConstraint.constant = 200
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = true
        }, completion: nil)
    }
    }
    
    @objc func presentCamerView() {
        bottomConstraint.constant = 600
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.hideOrshow = false
        }, completion: nil)
        
        present(camerView, animated: true, completion: nil)
    }
    
}

