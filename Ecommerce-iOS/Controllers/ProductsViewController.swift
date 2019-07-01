//
//  ProductsViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase

class ProductsViewController: UIViewController,ProductCellDelegate, CartDelegate{
    
    
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = CoreDataManager.shared.persistentContainer.viewContext
    
    var products: [Product] = []
    
    func checkoutButtonClicked() {
        optionsLauncher.handleCartDismiss()
        navigationController?.pushViewController(CheckoutViewController(), animated: true)
    }
    
    func addToCartDidSelect() {
        optionsLauncher.showOptionsDrawView()
    }
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    let productCellIdentifier = "ProductCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        optionsLauncher.cartDrawerView.cartDelegate = self
        //signOut()
        authenticateUserAndConfigureView()
        CoreDataManager.shared.addProductsToCoreData()
        do {
            products = try context.fetch(Product.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
//
       
        
//
//        appDelegate.saveContext()
//        friends.append(friend)
//        let index = IndexPath(row:friends.count - 1, section:0)
//        collectionView?.insertItems(at: [index])
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            products = try context.fetch(Product.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
   let optionsLauncher = ProductOptionsLauncher()
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        optionsLauncher.showCartDrawView()
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let navController = UINavigationController(rootViewController: StartUpViewController())
            navController.navigationBar.barStyle = .black
            self.present(navController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error..", error)
        }
    }
    
    @IBAction func testSignOut(_ sender: Any) {
        signOut()
    }
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: StartUpViewController())
                navController.navigationBar.barStyle = .black
                self.present(navController, animated: true, completion: nil)
            }
        } else {
            configureViewComponents()
        }
    }
    
    func configureViewComponents() {
        let nibCell = UINib(nibName: "ProductsCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 330)
    }
    
    
    @IBOutlet weak var selectionViewTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var selectionViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var TeaButton: UIButton!
    @IBAction func TeaTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.selectionView.leadingAnchor.constraint(equalTo: self.TeaButton.leadingAnchor)
            self.selectionView.trailingAnchor.constraint(equalTo: self.TeaButton.trailingAnchor)
           self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        var width = self.view.frame.size.width - 40
////        width = width - (width/5)
//        return CGSize(width: self.view.frame.width, height: 350)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath) as! ProductsCell
        productCell.delegate = self
//        productCell.delegate = self
//        productCell.title.text = products[indexPath.item].title
//        productCell.subtitle.text = products[indexPath.item].subtitle
//        productCell.price.text = String(products[indexPath.item].price)
        //productCell.productDescription.text = products[indexPath.item].productDescription
        return productCell
        
        
    }

    
    func didSelect() {
        navigationController?.pushViewController(ProductDetailsViewController(), animated: true)
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        optionsLauncher.showOptionsDrawView()
    }
}
