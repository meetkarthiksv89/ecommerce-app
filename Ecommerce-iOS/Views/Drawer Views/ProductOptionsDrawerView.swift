//
//  ProductOptionsDrawerView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductOptionsDrawerView: DrawerView {
    
    let chooseOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Options"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
      
       
        
        headerView.addSubview(chooseOptionsLabel)
        footerView.addSubview(priceLabel)
        footerView.addSubview(cartButton)
        addViewConstraints()
    }
    
    func addViewConstraints() {
        let views: [String: Any] = [
            "chooseOptionsLabel":chooseOptionsLabel,
            "priceLabel":priceLabel,
            "cartButton":cartButton,
        ]
        
        addConstraint(NSLayoutConstraint(item: chooseOptionsLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let priceLabelVertical =  NSLayoutConstraint.constraints(
            withVisualFormat: "V:[priceLabel]-0-|",
            metrics: nil,
            views: views)
        
        allConstraints += priceLabelVertical
        
        let priceLabelHorizontal = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-10-[priceLabel]-[cartButton(50)]-10-|",
            metrics: nil,
            views: views)
        allConstraints += priceLabelHorizontal
        
        let chooseOptionsLabelVertical = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[chooseOptionsLabel]-0-|",
            metrics: nil,
            views: views)
        allConstraints += chooseOptionsLabelVertical
        
        let chooseOptionsLabelHorizontal = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-10-[chooseOptionsLabel]-0-|",
            metrics: nil,
            views: views)
        allConstraints += chooseOptionsLabelHorizontal
        
        let cartButtonVertical = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[cartButton(50)]-0-|",
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
