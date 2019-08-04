//
//  Product.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/30/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: String
    let title: String
    let subtitle: String
    let description: String
    let price: String
    let category: String
    let imageFileName: String
    let options: [Option]
    let variations: [Variation]
    
    enum DecodingError: Error {
        case missingFile
    }
}

struct Option: Decodable {
    let product_id: String
    let name: String
    let position: Int
    let values: [String]
    var selectedValue: String?
}

struct Variation: Decodable {
    let product_id: String
    let title: String
    let price: String
}


