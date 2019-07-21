//
//  Array+Product.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/20/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation



extension Array where Element == Product {
    /// This init method takes the file name and decodes the json and return the product array
    ///
    /// - Parameter fileName: JSON file name
    /// - Throws: Missing file error
    init(fileName: String) throws {
        guard let url = Bundle.main.url(forResource: "pandurangachatbot-export", withExtension: "json") else {
            throw Product.DecodingError.missingFile
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([Product].self, from: data)
    }
}
