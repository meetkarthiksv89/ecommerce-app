//
//  Product+CoreDataProperties.swift
//  
//
//  Created by Karthik Venkatesh on 6/19/19.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var productDescription: String?
    @NSManaged public var price: Int64

}
