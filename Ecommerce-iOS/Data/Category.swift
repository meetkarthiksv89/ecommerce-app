//
//  Category.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/20/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation


struct Category {
    let categoryName: String
    let categoryProducts: [Product]
    
    init(name: String, products: [Product]) {
        categoryName = name
        categoryProducts = products
    }
}
