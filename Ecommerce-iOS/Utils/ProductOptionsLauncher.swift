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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(rgb: 0xF3E7CB, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
   
    let chooseOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Options"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 25)!
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "₹500"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 35)!
        return label
    }()
    
    let cartButton: UIButton = {
        let button = UIButton(type: .custom)
//        button.setTitle("Cart", for: .normal)
        button.setImage(UIImage(named: "cart_icon"), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchDragInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let priceLabel2: UILabel = {
        let label = UILabel()
        label.text = "₹500"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 35)!
        return label
    }()
    
    let drawerView = UIView()
    
    let cellId = "OptionsCellId"
    
    @objc func buttonClicked(){
        print("Called")
    }
    
    func showBlackView() {
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            drawerView.backgroundColor = UIColor(rgb: 0xF3E7CB, alpha: 1)
            drawerView.layer.cornerRadius = 20;
            drawerView.layer.masksToBounds = true;
            
            
            
            drawerView.addSubview(collectionView)
            
            drawerView.addSubview(chooseOptionsLabel)
            drawerView.addSubview(priceLabel)
            //drawerView.addSubview(priceLabel2)
            drawerView.addSubview(cartButton)
            
            drawerView.addConstraint(NSLayoutConstraint(item: chooseOptionsLabel, attribute: .centerX, relatedBy: .equal, toItem: drawerView, attribute: .centerX, multiplier: 1, constant: 0))
            
            

            let views: [String: Any] = [
                "collectionView": collectionView,
                "chooseOptionsLabel":chooseOptionsLabel,
                "priceLabel":priceLabel,
                "cartButton":cartButton,
            "priceLabel2":priceLabel2]

            // 2
            var allConstraints: [NSLayoutConstraint] = []


            let collectionVertical = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-10-[chooseOptionsLabel]-10-[collectionView]-20-[priceLabel]-30-|",
                metrics: nil,
                views: views)
            allConstraints += collectionVertical

            let collectionHorizontal = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-20-[collectionView]-20-|",
                metrics: nil,
                views: views)
            allConstraints += collectionHorizontal

            let priceLabelHorizontal = NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-30-[priceLabel]-[cartButton(50)]-20-|",
                metrics: nil,
                views: views)
            allConstraints += priceLabelHorizontal
            
            let cartButtonVertical = NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-10-[chooseOptionsLabel]-10-[collectionView]-20-[cartButton(50)]-30-|",
                metrics: nil,
                views: views)
            allConstraints += cartButtonVertical

            NSLayoutConstraint.activate(allConstraints)
            
            
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
        collectionView.dataSource = self
        collectionView.delegate = self
        

        
        
        collectionView.register(OptionsCell.self, forCellWithReuseIdentifier: cellId)

        
    }
}


