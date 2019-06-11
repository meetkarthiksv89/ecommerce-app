//
//  InfoViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/2/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class InfoViewController: PViewController, CartDelegate {
    func checkoutButtonClicked() {
        cartLauncher.handleCartDismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.title.text = "Checkout"
        header.navButton.setImage(UIImage(named: "cart_brown_icon"), for: .normal)
        header.navButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    
    let cartLauncher = ProductOptionsLauncher()
    
    @objc func cartButtonTapped() {
        cartLauncher.showCartDrawView()
        cartLauncher.cartDrawerView.cartDelegate = self
    }

}
