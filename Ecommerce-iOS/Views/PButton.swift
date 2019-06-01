//
//  PButton.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class PButton: UIButton {
    
    enum type {
        case brown
        case yellow
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(type: type) {
        self.init(frame: .zero)
        setupView(type: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView(type: type) {
        
        switch type {
        case .brown:
            self.backgroundColor = UIColor.brandBrown
            self.setTitleColor(UIColor.yellow, for: .normal)
        default:
            self.backgroundColor = UIColor.brandYellow
            self.setTitleColor(UIColor.brandBrown, for: .normal)
        }
        
        self.layer.cornerRadius = 25
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont(name: "Avenir", size: 16)!
        self.adjustsImageWhenHighlighted = true
        self.adjustsImageWhenDisabled = true
    }
    
    func animate() {
        UIButton.animate(withDuration: 0.2,
                         animations: {
                            self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.2, animations: {
                                self.transform = CGAffineTransform.identity
                            })
        })
    }
}
