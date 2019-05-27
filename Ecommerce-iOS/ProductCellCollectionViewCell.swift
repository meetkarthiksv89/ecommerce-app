//
//  ProductCellCollectionViewCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = true;
        
        
        // Initialization code
    }

}
