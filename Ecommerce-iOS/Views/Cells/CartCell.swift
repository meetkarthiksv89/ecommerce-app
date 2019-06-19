//
//  CartCellNewCollectionViewCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class CartCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        
        // Initialization code
    }
    func configureCell() {
        cellView.backgroundColor = UIColor.brandCream
        productTitle.font = UIFont(name: "Avenir", size: 16)!
        price.font = UIFont(name: "Avenir-Heavy", size: 20)!
        quantity.font = UIFont(name: "Avenir", size: 14)!
    }
    @IBAction func incrementButtonTapped(_ sender: Any) {
    }
    
    @IBAction func decrementButtonTapped(_ sender: Any) {
    }
}
