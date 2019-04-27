//
//  WeekCell.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 4/15/19.
//  Copyright © 2019 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class WeekCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lineSepTop: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSepBottom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        addSubview(image)
        addSubview(label)
        addSubview(lineSepTop)
        addSubview(lineSepBottom)
        
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        lineSepTop.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineSepTop.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineSepTop.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lineSepTop.heightAnchor.constraint(equalToConstant: 0.9).isActive = true
        
        lineSepBottom.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineSepBottom.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineSepBottom.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineSepBottom.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    }
    
}
