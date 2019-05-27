//
//  ProductsViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    let productCellIdentifier = "ProductCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "ProductCellCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    let optionsLauncher = ProductOptionsLauncher()
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        optionsLauncher.showBlackView()
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellIdentifier, for: indexPath) as! ProductCellCollectionViewCell
        return productCell
    }
    
    
}
