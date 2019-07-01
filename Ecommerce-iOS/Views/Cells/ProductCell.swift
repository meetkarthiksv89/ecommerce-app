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
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBackground.layer.borderWidth = 1.0
        imageBackground.layer.cornerRadius = 10.0
    }

}
