//
//  QuickWeatherView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 12/11/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class QuickWeatherView: UIView {
    
    let searchBarTextField:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(white: 0.8, alpha: 0.8)
        textField.font = UIFont(name: "PingFangSC-Thin", size: 18)
        textField.placeholder = "Enter City name,State name"
        textField.layer.cornerRadius = 5
        textField.textColor = .white
        textField.textAlignment = .center
        return textField
    }()
    
    let searchButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(white: 0.6, alpha: 0.8)
        button.setBackgroundImage(UIImage(named: "search"), for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let showQuickMainWeather:UILabel = {
        let textView = UILabel()
        textView.font = UIFont(name: "PingFangSC-Thin", size: 55)
        textView.textColor = .white
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = UIColor(white: 0.2, alpha: 0.9)
        setUpQuickWeatherView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpQuickWeatherView() {
        addSubview(searchBarTextField)
        addSubview(searchButton)
        addSubview(showQuickMainWeather)
        
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        showQuickMainWeather.translatesAutoresizingMaskIntoConstraints = false
        
        searchBarTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        searchBarTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor).isActive = true
        searchBarTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        searchBarTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchButton.leadingAnchor.constraint(equalTo: searchBarTextField.trailingAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        showQuickMainWeather.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        showQuickMainWeather.topAnchor.constraint(equalTo: searchBarTextField.bottomAnchor, constant: 15).isActive = true
        showQuickMainWeather.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true

    }
    
}
