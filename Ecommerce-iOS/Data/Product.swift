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
    
    enum DecodingError: Error {
        case missingFile
    }
}


