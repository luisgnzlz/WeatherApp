//
//  MoreWeatherDataView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/27/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

final class MoreWeatherDataView: UIView {
    
    let minWeather:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "test"
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    private let minmaxLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let maxWeather:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "test"
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    let airPressure:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    let humidity:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    private let airhumidityLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let descriptionWeather:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "this is a test"
        label.font = UIFont(name: "PingFangSC-Thin", size: 25)
        return label
    }()
    
    private let descriptionLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let windSpeed:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    let windDegree:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    private let windLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let sunrise:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    let sunset:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    private let sunLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let visibility:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "this is a test"
        label.textAlignment = .center
        label.font = UIFont(name: "PingFangSC-Thin", size: 18)
        return label
    }()
    
    private let minMaxSepLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let airSepLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let windSepLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let sunSepLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 0.8)
        layer.cornerRadius = 10
        setUpMoreWeather()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpMoreWeather() {
        addSubview(descriptionWeather)
        addSubview(descriptionLine)
        addSubview(minWeather)
        addSubview(maxWeather)
        addSubview(minmaxLine)
        addSubview(minMaxSepLine)
        addSubview(airPressure)
        addSubview(humidity)
        addSubview(airSepLine)
        addSubview(airhumidityLine)
        addSubview(windSpeed)
        addSubview(windDegree)
        addSubview(windSepLine)
        addSubview(windLine)
        addSubview(sunrise)
        addSubview(sunSepLine)
        addSubview(sunset)
        
        descriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        descriptionWeather.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        descriptionWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
        descriptionWeather.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        descriptionLine.topAnchor.constraint(equalTo: descriptionWeather.bottomAnchor, constant: 5).isActive = true
        bottomLine(view: descriptionLine)
        
        minWeather.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        leftSideLayout(label: minWeather)
        
        minMaxSepLine.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        minMaxSepLine.leadingAnchor.constraint(equalTo: minWeather.trailingAnchor).isActive = true
        sepHeightWidth(view: minMaxSepLine)
        
        maxWeather.translatesAutoresizingMaskIntoConstraints = false
        maxWeather.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        maxWeather.leadingAnchor.constraint(equalTo: minWeather.trailingAnchor, constant: -10).isActive = true
        maxWeather.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        minmaxLine.translatesAutoresizingMaskIntoConstraints = false
        minmaxLine.topAnchor.constraint(equalTo: maxWeather.bottomAnchor, constant: 5).isActive = true
        bottomLine(view: minmaxLine)
        
        airPressure.topAnchor.constraint(equalTo: minmaxLine.bottomAnchor, constant: 5).isActive = true
        leftSideLayout(label: airPressure)
        
        airSepLine.topAnchor.constraint(equalTo: minmaxLine.bottomAnchor, constant: 5).isActive = true
        airSepLine.leadingAnchor.constraint(equalTo: airPressure.trailingAnchor).isActive = true
        sepHeightWidth(view: airSepLine)
        
        humidity.translatesAutoresizingMaskIntoConstraints = false
        humidity.topAnchor.constraint(equalTo: minmaxLine.bottomAnchor, constant: 5).isActive = true
        humidity.leadingAnchor.constraint(equalTo: airPressure.trailingAnchor, constant: -10).isActive = true
        humidity.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        airhumidityLine.topAnchor.constraint(equalTo: airPressure.bottomAnchor, constant: 5).isActive = true
        bottomLine(view: airhumidityLine)
        
        windSpeed.topAnchor.constraint(equalTo: airhumidityLine.bottomAnchor, constant: 5).isActive = true
        leftSideLayout(label: windSpeed)
        
        windSepLine.topAnchor.constraint(equalTo: airhumidityLine.bottomAnchor, constant: 5).isActive = true
        windSepLine.leadingAnchor.constraint(equalTo: windSpeed.trailingAnchor).isActive = true
        sepHeightWidth(view: windSepLine)
        
        windDegree.translatesAutoresizingMaskIntoConstraints = false
        windDegree.topAnchor.constraint(equalTo: airhumidityLine.bottomAnchor, constant: 5).isActive = true
        windDegree.leadingAnchor.constraint(equalTo: windSpeed.trailingAnchor, constant: -10).isActive = true
        windDegree.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        windLine.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 5).isActive = true
        bottomLine(view: windLine)
        
        sunrise.topAnchor.constraint(equalTo: windLine.bottomAnchor, constant: 5).isActive = true
        leftSideLayout(label: sunrise)
        
        sunSepLine.topAnchor.constraint(equalTo: windLine.bottomAnchor, constant: 5).isActive = true
        sunSepLine.leadingAnchor.constraint(equalTo: sunrise.trailingAnchor).isActive = true
        sepHeightWidth(view: sunSepLine)
        
        sunset.translatesAutoresizingMaskIntoConstraints = false
        sunset.topAnchor.constraint(equalTo: windLine.bottomAnchor, constant: 5).isActive = true
        sunset.leadingAnchor.constraint(equalTo: sunrise.trailingAnchor, constant: -10).isActive = true
        sunset.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
    }
    
    func leftSideLayout(label:UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
    }
    
    func bottomLine(view:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func sepHeightWidth(view:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 23).isActive = true
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}
