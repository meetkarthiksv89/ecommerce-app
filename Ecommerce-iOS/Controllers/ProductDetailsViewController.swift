//
//  ProductDetailsViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/29/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "CartCell", bundle: nil)
        optionsCollectionView.register(nibCell, forCellWithReuseIdentifier: "CartOptionCellId")
        optionsCollectionView.delegate = self
        optionsCollectionView.dataSource = self
        let layout = optionsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 80)
        
        

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let optionsLauncher = ProductOptionsLauncher()
    @IBAction func addToCartTapped(_ sender: Any) {
        
        optionsLauncher.showOptionsDrawView()
    }
    
}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartOptionCellId", for: indexPath) as! CartCell
        return cell
    }
   
    
}
