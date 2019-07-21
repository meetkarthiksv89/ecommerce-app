//
//  ProductCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var imageBackground: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product: Product? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        productName.text = product?.title
        productPrice.text = product?.price.priceString
        productImage.image = UIImage(named: product!.imageFileName)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBackground.layer.borderWidth = 1.0
        imageBackground.layer.cornerRadius = 10.0
    }

}
