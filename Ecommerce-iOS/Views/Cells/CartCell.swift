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
    @IBOutlet weak var productVariations: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    var product: CartProduct? {
        didSet {
            self.udpateUI()
        }
    }
    
    func udpateUI() {
        if let product = product {
            productTitle.text = product.product.title
            productImageView.image = UIImage(named: product.product.imageFileName)
            quantity.text = String(product.quantity) + product.product.minimumQuantityUnit
            
            let price = Int(product.selectedVariant.price)! * product.quantity
            self.price.text = String(price).priceString
            
            productVariations.text = product.selectedVariant.title
        }
       
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        
        // Initialization code
    }
    func configureCell() {
        cellView.backgroundColor = UIColor.brandCream
        productTitle.font = UIFont(name: "Avenir", size: 16)!
        price.font = UIFont(name: "Avenir-Heavy", size: 18)!
        quantity.font = UIFont(name: "Avenir", size: 12)!
    }
    @IBAction func incrementButtonTapped(_ sender: Any) {
    }
    
    @IBAction func decrementButtonTapped(_ sender: Any) {
    }
}
