//
//  ProductViewModel.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/20/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation



enum CategoryName: String {
    case Coffee = "coffee"
    case Tea = "tea"
    case Spices = "spices"
}

class ProductViewModel {
    var products: [Product]?
    var categoriesWithProduct: [String:[Product]] = [:]
    var totalCategories: Int {
        return categoriesWithProduct.keys.count
    }
    
    var categories: [Category] = []
    init() {
        do {
            products = try [Product](fileName: "asdf")
            categorizeProducts()
        }
        catch {
            print(error)
        }
    }
    
    private func categorizeProducts() {
        if let products = self.products {
            for product in products {
                if categoriesWithProduct[product.category] == nil {
                    categoriesWithProduct[product.category] = [product]
                }
                else {
                    var productsInCategory = categoriesWithProduct[product.category]
                    productsInCategory?.append(product)
                    categoriesWithProduct[product.category] = productsInCategory
                }
            }
            
            for category in categoriesWithProduct {
                
                let cat = Category(name: category.key, products: category.value)
                categories.append(cat)
            }
            
            print(categories)
        }
    }
    
    func getCategory(name: CategoryName) -> Category?{
        for category in categories {
            if category.categoryName == name.rawValue {
                return category
            }
        }
        return nil
    }
}
