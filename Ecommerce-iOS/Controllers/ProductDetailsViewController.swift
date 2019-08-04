//
//  ProductDetailsViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/29/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var price: UILabel!
    
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        tabBarController?.tabBar.isHidden = true
        productImage.image = UIImage(named: product?.imageFileName ?? "GA")
        productTitle.text = product?.title
        price.text = product?.price.priceString
        productDescription.text = product?.description
    }

    let optionsLauncher = OptionsLauncher()
    @IBAction func addToCartTapped(_ sender: Any) {
        if let product = product {
            optionsLauncher.showOptionsDrawView(withOptions: product.options)
        }
    }
    
}
