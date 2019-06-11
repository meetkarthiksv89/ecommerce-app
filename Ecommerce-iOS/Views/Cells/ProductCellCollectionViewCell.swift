//
//  ProductCellCollectionViewCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func addToCartDidSelect()
}

class ProductCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var delegate: ProductCellDelegate?
    
    
    fileprivate func configureCell() {
        self.layer.cornerRadius = 20;
        self.layer.masksToBounds = true;
        
        // iphone 5s,SE screen width 320
        // iphone 6,6s,7,etc width 375
        // iphone 7 plus, 8 plus, xs max,etc width 414
        if let window = UIApplication.shared.keyWindow {
            imageViewHeight.constant = window.frame.height/3
            if (window.frame.width == 320) {
                
                title.font = UIFont(name: title.font.fontName, size: 18)
                subtitle.font = UIFont(name: subtitle.font.fontName, size: 10)
                price.font = UIFont(name: price.font.fontName, size: 20)
                productDescription.font = UIFont(name: productDescription.font.fontName, size: 11)
                
            } else if (window.frame.width == 375) {
                
                title.font = UIFont(name: title.font.fontName, size: 20)
                subtitle.font = UIFont(name: subtitle.font.fontName, size: 12)
                price.font = UIFont(name: price.font.fontName, size: 28)
                productDescription.font = UIFont(name: productDescription.font.fontName, size: 13)
                
            } else if (window.frame.width == 414) {
                
                title.font = UIFont(name: title.font.fontName, size: 20)
                subtitle.font = UIFont(name: subtitle.font.fontName, size: 12)
                price.font = UIFont(name: price.font.fontName, size: 28)
                productDescription.font = UIFont(name: productDescription.font.fontName, size: 16)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    @IBAction func addToCartButtonTapped(_ sender: Any) {
        delegate?.addToCartDidSelect()
    }
}
