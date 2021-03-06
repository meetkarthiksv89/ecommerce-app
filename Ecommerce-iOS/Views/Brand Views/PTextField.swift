//
//  PTextField.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/30/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class PTextField: UITextField {
    
    var secureField: Bool? {
        didSet {
            self.secureField = true
            self.isSecureTextEntry = true
        }
    }

    var placeholderText: String? {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholderText ?? "",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: 0.4),
                                                                                     NSAttributedString.Key.font:  UIFont(name: "Avenir", size: 14)!])
        }
    }
    
    fileprivate func setupView() {
        self.textColor = UIColor.brandYellow
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.brandYellow.cgColor
        self.layer.cornerRadius = 25.0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.font = UIFont(name: "Avenir-Heavy", size: 14)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
