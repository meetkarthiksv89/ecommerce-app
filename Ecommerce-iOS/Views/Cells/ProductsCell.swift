//
//  ProductsCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/19/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func didSelect()
}

class ProductsCell: UICollectionViewCell {

    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var delegate: ProductCellDelegate?
    
    let productsCellId = "ProductCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let productCellNib = UINib(nibName: "ProductCell", bundle: nil)
        productsCollectionView.register(productCellNib, forCellWithReuseIdentifier: productsCellId)
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        let layout = productsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: 200, height: 400)
    }

}

extension ProductsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productsCellId, for: indexPath) as! ProductCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: 350)
//    } 
    
}
