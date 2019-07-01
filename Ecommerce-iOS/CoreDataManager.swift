//
//  CoreDataManager.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager: NSObject {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Panduranga")
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            print(storeDescription)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func addProductsToCoreData() {
        let urlPath = Bundle.main.url(forResource: "pandurangachatbot-export", withExtension: "json")
        var json = Dictionary<String, Any>()
        do {
            let data = try Data(contentsOf: urlPath!)
            let productsData = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any>
            
            if let products = productsData["products"] as? Dictionary<String,Any> {
                let productKeys = products.keys
                for anIem in productKeys {
                    let product = Product(entity: Product.entity(), insertInto: persistentContainer.viewContext)
                    let p = products[anIem] as! Dictionary<String,Any>
                    product.title = p["title"] as? String
                    product.productDescription = p["description"] as? String
                    
                    product.price = Int64((p["price"] as? String)!)!
                    
                    
                    product.subtitle = p["subtitle"] as? String
                    print(product)
                }
            }
            
            print(json)
            CoreDataManager.shared.saveContext()
            
            
        }
        catch {
            print(error)
        }
    }
    // MARK: -
}
