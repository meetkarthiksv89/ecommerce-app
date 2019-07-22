//
//  UIString+Email.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/28/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        
        
        
            if (self.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil &&
                self.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil &&
                self.count > 8) {
                return true
            }
            else {
                return false
            }
        
    }
    
    var priceString: String {
        return "₹" + self
    }
}
