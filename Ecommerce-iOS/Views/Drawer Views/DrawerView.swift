//
//  DrawerView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class DrawerView: UIView {
    
    var headerView: UIView = {
        let fv = UIView(frame: .zero)
        //fv.backgroundColor = UIColor.red
        fv.translatesAutoresizingMaskIntoConstraints = false
       
        return fv
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(rgb: 0xF3E7CB, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var footerView: UIView = {
        let fv = UIView(frame: .zero)
        fv.translatesAutoresizingMaskIntoConstraints = false
        return fv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.brandCream
        layer.cornerRadius = 20;
        layer.masksToBounds = true;
        
        addSubview(headerView)
        addSubview(collectionView)
        addSubview(footerView)
        
        let views: [String:Any] = [
            "headerView":headerView,
            "footerView":footerView,
            "collectionView":collectionView
        ]
        var constraints: [NSLayoutConstraint] = []
        
        
        
        //var heightConstraints = headerView.heightAnchor.constraint(equalToConstant: 40)
        //addConstraint(heightConstraints)
    
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[headerView]-[collectionView]-10-[footerView(40)]-20-|", metrics: nil, views: views)
        
        constraints += verticalConstraints
        
         addConstraint(NSLayoutConstraint(item: footerView, attribute: .height, relatedBy: .equal, toItem: footerView, attribute: .height, multiplier: 1, constant: 40))
        
        let horizontalHeaderViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[headerView]-10-|", metrics: nil, views: views)
        
        constraints += horizontalHeaderViewConstraints
        
        let horizontalCollectionViewConstraints =   NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", metrics: nil, views: views)
        
        constraints += horizontalCollectionViewConstraints
        
        let horizontalFooterViewContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[footerView]-10-|", metrics: nil, views: views)
        
        constraints += horizontalFooterViewContraints
        
        NSLayoutConstraint.activate(constraints)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
