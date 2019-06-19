//
//  QuantityCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class QuantityCell: UICollectionViewCell {

    @IBOutlet weak var quantitylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.brandCream
        quantitylabel.font = UIFont(name: "Avenir", size: 16)!
        // Initialization code
    }

}
