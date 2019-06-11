//
//  PInputFieldCellCollectionViewCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class PInputFieldCell: UICollectionViewCell {
    
    var textField = PTextField(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(textField)
        var constraints: [NSLayoutConstraint] = []
        
        let textFieldHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[textField]-15-|", metrics: nil, views: ["textField":textField])
        let textFieldVerticalContraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[textField]-0-|", metrics: nil, views: ["textField":textField])
        
        constraints += textFieldHorizontalContraints
        constraints += textFieldVerticalContraints
    
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
