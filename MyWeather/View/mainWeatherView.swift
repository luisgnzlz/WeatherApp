//
//  mainWeatherView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/18/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class mainWeatherView: UIView {
    
    let weatherTextView:UILabel = {
        let text = UILabel()
        text.backgroundColor = UIColor.clear
        text.textColor = .white
        text.textAlignment = .center
        text.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 75)!)
        return text
    }()
    
    let cityNameLabel:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontMetrics.default.scaledFont(for: UIFont(name: "PingFangSC-Thin", size: 25)!)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(weatherTextView)
        addSubview(cityNameLabel)
        weatherTextView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weatherTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        weatherTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherTextView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        weatherTextView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        cityNameLabel.topAnchor.constraint(equalTo: weatherTextView.bottomAnchor, constant: 10).isActive = true
        cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        cityNameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
