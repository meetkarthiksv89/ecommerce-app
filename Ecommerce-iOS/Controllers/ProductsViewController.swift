//
//  ProductsViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase
import ViewAnimator

class ProductsViewController: UIViewController,ProductCellDelegate, CartDelegate{
    
    var products: [Product] = []
    
    func checkoutButtonClicked() {
        optionsLauncher.handleCartDismiss()
        navigationController?.pushViewController(CheckoutViewController(), animated: true)
    }
    
    func addToCartDidSelect() {
        optionsLauncher.showOptionsDrawView()
    }
    

    let productViewModel = ProductViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    let productCellIdentifier = "ProductCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        optionsLauncher.cartDrawerView.cartDelegate = self
        //signOut()
        authenticateUserAndConfigureView()
        
        
        print(productViewModel.products!)
      
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
    
//    @IBAction func testSignOut(_ sender: Any) {
//        signOut()
//    }
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
    
    @IBAction func teaClicked(_ sender: Any) {
        
    }
    @IBAction func tabBarItemClicked(_ sender: UIButton) {
        let indexPath = IndexPath(item: sender.tag, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    fileprivate func assignProductCellCategory(_ indexPath: IndexPath, _ productCell: ProductsCell) {
        switch indexPath.item {
        case 0:
            productCell.category = productViewModel.getCategory(name: .Coffee)
        case 1:
            productCell.category = productViewModel.getCategory(name: .Tea)
        case 2:
            productCell.category = productViewModel.getCategory(name: .Spices)
        default:
            productCell.category = productViewModel.getCategory(name: .Tea)
        }
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModel.categories.count
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
        assignProductCellCategory(indexPath, productCell)
        return productCell
    }

    func didSelect() {
        navigationController?.pushViewController(ProductDetailsViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        optionsLauncher.showOptionsDrawView()
    }
}
