//
//  topMenuMainView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/19/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

final class TopMenuMainView: UIView {
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "options"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.alpha = 0.8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        //backgroundColor = UIColor(white: 0.9, alpha: 0.3)
        setViewOfTop()
        
    }
    
    private func setViewOfTop() {
        addSubview(infoButton)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        
        infoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        infoButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/8).isActive = true
        infoButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
