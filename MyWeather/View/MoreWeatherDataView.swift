//
//  MoreWeatherDataView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 11/27/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class MoreWeatherDataView: UIView {
    
    let minWeather:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "test"
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
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
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    let airPressure:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    let humidity:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
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
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
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
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    let windDegree:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
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
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    let sunset:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
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
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    private let minMaxSepLine:UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 0.8)
        setUpMoreWeather()
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
        addSubview(airhumidityLine)
        addSubview(windSpeed)
        addSubview(windDegree)
        addSubview(windLine)
        addSubview(sunrise)
        addSubview(sunset)
        
        descriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        descriptionWeather.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        descriptionWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
        descriptionWeather.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        descriptionLine.translatesAutoresizingMaskIntoConstraints = false
        descriptionLine.topAnchor.constraint(equalTo: descriptionWeather.bottomAnchor, constant: 5).isActive = true
        descriptionLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        descriptionLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        descriptionLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        minWeather.translatesAutoresizingMaskIntoConstraints = false
        minWeather.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        minWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
        minWeather.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        minMaxSepLine.translatesAutoresizingMaskIntoConstraints = false
        minMaxSepLine.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        minMaxSepLine.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minMaxSepLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        minMaxSepLine.leadingAnchor.constraint(equalTo: minWeather.trailingAnchor).isActive = true
        
        maxWeather.translatesAutoresizingMaskIntoConstraints = false
        maxWeather.topAnchor.constraint(equalTo: descriptionLine.bottomAnchor, constant: 5).isActive = true
        maxWeather.leadingAnchor.constraint(equalTo: minWeather.trailingAnchor, constant: -10).isActive = true
        maxWeather.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
