//
//  WeekForcast.swift
//  MyWeather
//
//  Created by Luis Gonzalez on 4/15/19.
//  Copyright © 2019 Luis Gonzalez Jr. All rights reserved.
//

import UIKit

class WeekForcast: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let CView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        CView.backgroundColor = .clear
        return CView
    }()
    
    func displayWeekForcst() {
        if let window = UIApplication.shared.keyWindow {
         window.addSubview(collectionView)
        self.collectionView.frame = CGRect(x: 0, y: window.frame.height/2 - 20, width: window.frame.width - 1.0, height: window.frame.height/6)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WeekCell
        cell.label.text = "\(indexPath.row) And this is where a weather date would go along with information"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(WeekCell.self, forCellWithReuseIdentifier: cellId)
    }

}
