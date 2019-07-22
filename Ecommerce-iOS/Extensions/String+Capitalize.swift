//
//  String+Capitalize.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/20/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
