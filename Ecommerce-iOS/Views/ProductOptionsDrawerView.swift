//
//  ProductOptionsDrawerView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductOptionsDrawerView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(rgb: 0xF3E7CB, alpha: 1)
        layer.cornerRadius = 20;
        layer.masksToBounds = true;
        
        addSubview(chooseOptionsLabel)
        addSubview(collectionView)
        addSubview(priceLabel)
        addSubview(cartButton)
        addViewConstraints()
    }
    
    func addViewConstraints() {
        let views: [String: Any] = [
            "collectionView": collectionView,
            "chooseOptionsLabel":chooseOptionsLabel,
            "priceLabel":priceLabel,
            "cartButton":cartButton,
        ]
        
        addConstraint(NSLayoutConstraint(item: chooseOptionsLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
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
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked(){
        print("Called")
    }
}
