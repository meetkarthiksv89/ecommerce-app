//
//  CartCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class CartCell: UICollectionViewCell {
    
    let productImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "AG"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.text = "Grand Aroma"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 16)!
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.text = "₹500"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 20)!
        return label
    }()
    
    let productQuantity: UILabel = {
        let label = UILabel()
        label.text = "2 Kilos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 14)!
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor(rgb: 0x3A1500, alpha: 1)
        slider.thumbTintColor = UIColor(rgb: 0xE8A94F, alpha: 1)
        return slider
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(productImage)
        addSubview(productPrice)
        //addSubview(productQuantity)
        addSubview(slider)
        addSubview(productTitle)
        
        
        let optionsView = UIStackView()
        optionsView.axis = .vertical
        optionsView.distribution = .equalSpacing;
        optionsView.alignment = .trailing;
        optionsView.spacing = 0;
        optionsView.addArrangedSubview(productQuantity)
        optionsView.addArrangedSubview(productPrice)
        optionsView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(optionsView)
        
        
        let views: [String: Any] = [
            "productImage":productImage,
            "productTitle":productTitle,
            "productQuantity":productQuantity,
            "productPrice":productPrice,
            "slider":slider,
            "optionsView":optionsView
            
        ]
        
        var constraints:[NSLayoutConstraint] = []
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[productImage(30)]-10-[productTitle]-[optionsView]-10-|", metrics: nil, views: views)
        
        constraints += horizontalConstraints
        
        let sliderHorizontal = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-10-[slider]-10-|",
            metrics: nil,
            views: views)
        constraints += sliderHorizontal
        
        let sliderVertical = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-10-[productImage(30)]-5-[slider]",
            metrics: nil,
            views: views)
        constraints += sliderVertical
        
        addConstraint(NSLayoutConstraint(item: productTitle, attribute: .centerY, relatedBy: .equal, toItem: productImage, attribute: .centerY, multiplier: 1.0, constant: 0))
        
//        let optionTypeVertical = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-10-[productTitle]",
//            metrics: nil,
//            views: views)
//        constraints += optionTypeVertical
        
        let optionValueVertical = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-10-[optionsView]",
            metrics: nil,
            views: views)
        constraints += optionValueVertical
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
