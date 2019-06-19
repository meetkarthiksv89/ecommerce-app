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
    
    let cartDrawerView = CartDrawerView(frame: .zero)
    let optionsDrawerView = ProductOptionsDrawerView(frame: .zero)
    
    let cellId = "OptionCellId"
    let quantityCellID = "quantityCellID"
    let cartOptionCellId = "CartOptionCellId"
    
    @objc func buttonClicked(){
        print("Called")
    }
    
    func showCartDrawView() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCartDismiss)))
            
            blackView.layer.cornerRadius = 20;
            blackView.layer.masksToBounds = true;
            
            window.addSubview(blackView)
            window.addSubview(cartDrawerView)
            
            let height: CGFloat = window.frame.height/1.5
            let y = window.frame.height - height
            cartDrawerView.frame = CGRect(x: 0, y: window.frame.height
                , width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.cartDrawerView.frame = CGRect(x: 0, y: y, width: self.cartDrawerView.frame.width, height: self.cartDrawerView.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    func showOptionsDrawView() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleOptionsDismiss)))
            
            blackView.layer.cornerRadius = 20;
            blackView.layer.masksToBounds = true;
            
            window.addSubview(blackView)
            window.addSubview(optionsDrawerView)
            
            let height: CGFloat = 400
            let y = window.frame.height - height
            optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height
                , width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.optionsDrawerView.frame = CGRect(x: 0, y: y, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    @objc func handleCartDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.cartDrawerView.frame = CGRect(x: 0, y: window.frame.height, width: self.cartDrawerView.frame.width, height: self.cartDrawerView.frame.height)
            }
        }, completion: nil)
    }
    @objc func handleOptionsDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
            }
        }, completion: nil)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == optionsDrawerView.collectionView {
            if indexPath.item == 1 {
                return collectionView.dequeueReusableCell(withReuseIdentifier: quantityCellID, for: indexPath)
                
            }
            else {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
               return cell
            }
        }
        
        else {
         return collectionView.dequeueReusableCell(withReuseIdentifier: cartOptionCellId, for: indexPath)
        }
        
        
        
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override init() {
        super.init()
        cartDrawerView.collectionView.dataSource = self
        cartDrawerView.collectionView.delegate = self
        
        //cartDrawerView.collectionView.register(CartCell.self, forCellWithReuseIdentifier: cellId)
        let nibCell = UINib(nibName: "CartCell", bundle: nil)
        cartDrawerView.collectionView.register(nibCell, forCellWithReuseIdentifier: cartOptionCellId)
        
        optionsDrawerView.collectionView.dataSource = self
        optionsDrawerView.collectionView.delegate = self
        
        let optionsNib = UINib(nibName: "OptionCell", bundle: nil)
        
        optionsDrawerView.collectionView.register(optionsNib, forCellWithReuseIdentifier: cellId)
       
        
        
        let quantityNib = UINib(nibName: "QuantityCell", bundle: nil)
        
        optionsDrawerView.collectionView.register(quantityNib, forCellWithReuseIdentifier: quantityCellID)
    }
}


