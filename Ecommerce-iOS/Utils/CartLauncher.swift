//
//  ProductOptionsLauncher.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation
import UIKit

class CartLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let blackView = UIView()
    
    let cartManager = CartManager.shared
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
            cartDrawerView.collectionView.reloadData()
            cartDrawerView.totalPrice = cartManager.cart.total
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.cartDrawerView.frame = CGRect(x: 0, y: y, width: self.cartDrawerView.frame.width, height: self.cartDrawerView.frame.height)
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartManager.cart.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cartOptionCellId, for: indexPath) as? CartCell{
            cell.product = cartManager.cart.products[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: collectionView.frame.width, height: 80)

        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    override init() {
        super.init()
        cartDrawerView.collectionView.dataSource = self
        cartDrawerView.collectionView.delegate = self
        
        //cartDrawerView.collectionView.register(CartCell.self, forCellWithReuseIdentifier: cellId)
        let nibCell = UINib(nibName: "CartCell", bundle: nil)
        cartDrawerView.collectionView.register(nibCell, forCellWithReuseIdentifier: cartOptionCellId)
    }
}


