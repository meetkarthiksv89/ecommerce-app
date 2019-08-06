//
//  QuantityCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

protocol QuantityDelegate {
    func quantityUpdated()
}

class QuantityCell: UICollectionViewCell {
    
    var delegate: QuantityDelegate?
    
    @IBOutlet weak var quantity: UILabel!
    var productQuantity: Int = 1
    var unit: String = ""
    
    @IBOutlet weak var quantitylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.brandCream
        quantitylabel.font = UIFont(name: "Avenir", size: 16)!
        
        // Initialization code
    }
    
    func updateUI() {
        quantity.text = String(productQuantity) + " " + unit
    }

    @IBAction func quantityChanged(_ sender: UIButton) {
        
        // Decrement
        if sender.tag == 0 {
            if productQuantity == 1 {
                return
            }
            else {
                productQuantity = productQuantity - 1
            }
        }
        
        // Increment
        if sender.tag == 1 {
            productQuantity = productQuantity + 1
        }
        updateUI()
        delegate?.quantityUpdated()
    }
}
