//
//  Cart.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 8/5/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation

struct Cart {
    var products: [CartProduct] = []
    var subtotal: Int {
        return products.reduce(0, { (subTotal, product) -> Int in
            let price = Int(product.selectedVariant.price)! * product.quantity
            return subTotal + price
        })
    }
    var total: Int {
        return subtotal + shipping
    }
    var shipping: Int = 0
}
