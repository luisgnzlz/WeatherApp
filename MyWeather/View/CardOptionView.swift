//
//  cardOptionView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/27/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

final class CardOptionView: UIView {
    
     let cameraButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle("Take Picture For Background", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
     let pickPictureButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle("Pick A Picture For Background", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
     let pickColorButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.clear
        button.setTitle("Pick A Color For Background", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let cameraLine:UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    private let colorLine:UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        setCardView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCardView() {
        addSubview(cameraButton)
        addSubview(pickPictureButton)
        addSubview(cameraLine)
        addSubview(colorLine)
        addSubview(pickColorButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        pickPictureButton.translatesAutoresizingMaskIntoConstraints = false
        cameraLine.translatesAutoresizingMaskIntoConstraints = false
        colorLine.translatesAutoresizingMaskIntoConstraints = false
        pickColorButton.translatesAutoresizingMaskIntoConstraints = false
        
        cameraButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        cameraButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        cameraButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        cameraLine.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: 5).isActive = true
        cameraLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        cameraLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        cameraLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        pickPictureButton.topAnchor.constraint(equalTo: cameraLine.bottomAnchor, constant: 5).isActive = true
        pickPictureButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        pickPictureButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        pickPictureButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        colorLine.topAnchor.constraint(equalTo: pickPictureButton.bottomAnchor, constant: 5).isActive = true
        colorLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        colorLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        colorLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        pickColorButton.topAnchor.constraint(equalTo: colorLine.bottomAnchor, constant: 5).isActive = true
        pickColorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        pickColorButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        pickColorButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    @objc func presentCamerView() {
        
    }
    
}
