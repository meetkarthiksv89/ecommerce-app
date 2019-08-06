//
//  CartManager.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 8/4/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation


class CartManager {
    
    static let shared = CartManager()
    var cart = Cart()
    private init() { }
    
    func addProductToCart(product: Product, selectedVariant: Variation, quantity: Int) {
        var cartProduct = CartProduct(product: product, selectedVariant: selectedVariant, quantity: quantity)
        
        if cart.products.contains(cartProduct) {
            
            if let productInCart = cart.products.filter({ $0 == cartProduct}).first, let index = cart.products.firstIndex(of: cartProduct) {
                
                cartProduct.quantity += productInCart.quantity
                cart.products.remove(at: index)
                cart.products.append(cartProduct)
            }
        }
        else {
            cart.products.append(cartProduct)
        }
    }
}

