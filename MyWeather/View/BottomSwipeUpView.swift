//
//  BottomSwipeUpView.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 10/30/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class BottomSwipeUpView: UIView {
    
    let slideUpDiscrip:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight(rawValue: 400))
        label.textAlignment = .center
        label.text = "^ Swipe Up For More Details ^"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpBottomView()
    }
    
    private func setUpBottomView() {
        addSubview(slideUpDiscrip)
        
        slideUpDiscrip.translatesAutoresizingMaskIntoConstraints = false
        
        slideUpDiscrip.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        slideUpDiscrip.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        slideUpDiscrip.widthAnchor.constraint(equalToConstant: 155).isActive = true
        slideUpDiscrip.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
