//
//  CartProduct.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/22/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation

struct CartProduct: Equatable {
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        return lhs.product == rhs.product && lhs.selectedVariant == rhs.selectedVariant
    }

    let product: Product
    let selectedVariant: Variation
    var quantity: Int
    
    init(product: Product, selectedVariant: Variation, quantity: Int) {
        self.product = product
        self.selectedVariant = selectedVariant
        self.quantity = quantity
    }
}
