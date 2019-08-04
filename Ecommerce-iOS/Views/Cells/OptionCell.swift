//
//  OptionCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class OptionCell: UICollectionViewCell {
    
    @IBOutlet weak var optionTitle: UILabel!
    @IBOutlet weak var optionValue: UILabel!
    @IBOutlet weak var optionSelectorBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.brandCream
        // Initialization code
    }
    
    
    @IBAction func optionSelectorTapped(_ sender: Any) {
        
    }
}
