//
//  ProductOptionsLauncher.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation
import UIKit

class ProductOptionsLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    let blackView = UIView()
    
    let drawerView = ProductOptionsDrawerView(frame: .zero)
    
    
    let cellId = "OptionsCellId"
    
    @objc func buttonClicked(){
        print("Called")
    }
    
    func showDrawView() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            blackView.layer.cornerRadius = 20;
            blackView.layer.masksToBounds = true;
            
            window.addSubview(blackView)
            window.addSubview(drawerView)
            
            let height: CGFloat = 400
            let y = window.frame.height - height
            drawerView.frame = CGRect(x: 0, y: window.frame.height
                , width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.drawerView.frame = CGRect(x: 0, y: y, width: self.drawerView.frame.width, height: self.drawerView.frame.height)
            }, completion: nil)
        
        }
        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                    self.drawerView.frame = CGRect(x: 0, y: window.frame.height, width: self.drawerView.frame.width, height: self.drawerView.frame.height)
            }
            
            
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        drawerView.collectionView.dataSource = self
        drawerView.collectionView.delegate = self
        
        drawerView.collectionView.register(OptionsCell.self, forCellWithReuseIdentifier: cellId)
    }
}


