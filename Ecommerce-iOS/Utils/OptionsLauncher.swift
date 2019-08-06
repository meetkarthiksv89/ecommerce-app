//
//  OptionsLauncher.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/22/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import Foundation
import UIKit


class OptionsLauncher: NSObject {
    
    let blackView = UIView()
    let optionsDrawerView = ProductOptionsDrawerView(frame: .zero)
    
    
    
    let optionsCellId = "OptionCellId"
    let quantityCellID = "quantityCellID"
    let optionValuesCellId = "OptionsValuesCellId"
    
    var product: Product?
    var productID: String?
    /// Variable to know the selected option type
    var selectedIndex: IndexPath?
    var selectedVariant: Variation?
    
    var insideOptionValues: Bool = false
    
    var options: [Option]?
    
    override init() {
        super.init()
        
        optionsDrawerView.collectionView.dataSource = self
        optionsDrawerView.collectionView.delegate = self
        
        let optionsNib = UINib(nibName: "OptionCell", bundle: nil)
        
        optionsDrawerView.collectionView.register(optionsNib, forCellWithReuseIdentifier: optionsCellId)
        
        let quantityNib = UINib(nibName: "QuantityCell", bundle: nil)
        
        optionsDrawerView.collectionView.register(quantityNib, forCellWithReuseIdentifier: quantityCellID)
        let valuesNib = UINib(nibName: "ValuesCell", bundle: nil)
        
        optionsDrawerView.collectionView.register(valuesNib, forCellWithReuseIdentifier: optionValuesCellId)
        
        optionsDrawerView.cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    let cartLauncher = CartLauncher()
    @objc func cartButtonTapped() {
        
        if let selectedVariant = selectedVariant, let product = product {
            if let cell = optionsDrawerView.collectionView.cellForItem(at: IndexPath(item: options!.count, section: 0)) as? QuantityCell{
                 CartManager.shared.addProductToCart(product: product, selectedVariant: selectedVariant, quantity: cell.productQuantity)
                
                handleOptionsDismiss()
                cartLauncher.showCartDrawView()
            }
           
        }
        
    }
    
    
    
    /// Show draw
    ///
    /// - Parameter withOptions: <#withOptions description#>
    func showOptionsDrawView(forProduct product: Product) {
        
        self.product = product
        productID = product.id
        self.options = product.options
        
        optionsDrawerView.priceLabel.text = product.price.priceString
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleOptionsDismiss)))
            
            
            window.addSubview(blackView)
            window.addSubview(optionsDrawerView)
            
            optionsDrawerView.options = options
            
            let height: CGFloat = 320
            let y = window.frame.height - height
            optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height
                , width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            self.optionsDrawerView.priceLabel.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                
                self.optionsDrawerView.frame = CGRect(x: 0, y: y, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
                
            }, completion: { a in
                self.updatePrice()
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                    
                    self.optionsDrawerView.priceLabel.alpha = 1
                    
                }, completion: nil)
                
            })
            
        }
        
        
        
    }
    
    @objc func handleOptionsDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
            }
        }, completion: { a in
           
        })
    }
    
    func updatePrice() {
        
        var selectedOptionsValues = [String]()
        
        if let options = options {
            for option in options {
                selectedOptionsValues.append((option.selectedValue != nil) ? option.selectedValue! : option.values[0])
            }
        }
        
        let title = selectedOptionsValues.joined(separator: "/")
        let variant = ProductViewModel.shared.getProductVariation(id: productID!, title: title)
        selectedVariant = variant
        
        if let cell = optionsDrawerView.collectionView.cellForItem(at: IndexPath(item: options!.count , section: 0)) as? QuantityCell, let variant = variant{
            
            let price = cell.productQuantity * Int(variant.price)!
            
            
            let formatter = NumberFormatter()              // Cache this, NumberFormatter creation is expensive.
            formatter.locale = Locale(identifier: "en_IN") // Here indian locale with english language is used
            formatter.numberStyle = .decimal               // Change to `.currency` if needed
            
            // price = formatter.string(from: NSNumber(value: price))
            optionsDrawerView.priceLabel.text = formatter.string(from: NSNumber(value: price))?.priceString
        }
        
        
    }
    
}

// MARK: - <#UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout#>
extension OptionsLauncher:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // For values table, return the number of the values for the option type
        if insideOptionValues, let options = options, let selectedIndex = selectedIndex {
            let option = options[selectedIndex.row]
            return option.values.count
        }
        
        // Return number of option types
        if let options = options {
            return options.count + 1
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if insideOptionValues , let selectedIndex = selectedIndex, let options = optionsDrawerView.options {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionValuesCellId, for: indexPath) as? ValuesCell {
                
                let option = options[selectedIndex.row]
                cell.valueLabel.text = option.values[indexPath.item]
                cell.backgroundColor = UIColor.brandCream
                return cell
            }
        }
        
        if indexPath.item == optionsDrawerView.options!.count {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: quantityCellID, for: indexPath) as? QuantityCell {
                cell.delegate = self
                cell.unit = product!.minimumQuantityUnit
                cell.updateUI()
                return cell
            }
        }
            
        else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionsCellId, for: indexPath) as? OptionCell, let options = options {
                
                cell.optionTitle.text = options[indexPath.item].name
                
                
                cell.optionValue.text = (options[indexPath.item].selectedValue != nil) ? options[indexPath.item].selectedValue : options[indexPath.item].values[0]
                
                
                return cell
                
            }
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 40)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !insideOptionValues && indexPath.item == options!.count {
            return
        }
        // If not in inside option value, set the selected index value to reference the values later.
        if !insideOptionValues {
            selectedIndex = indexPath
            
        }
            
        else {
            //TODO : Safe unwrapping
            if let selectedIndex = selectedIndex {
                options![selectedIndex.item].selectedValue = options![selectedIndex.item].values[indexPath.item]
                
            }
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.optionsDrawerView.titleLabel.alpha = 0
            self.optionsDrawerView.collectionView.alpha = 0
        }) { (a) in
            self.optionsDrawerView.collectionView.reloadData()
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                
                if !self.insideOptionValues {
                    self.optionsDrawerView.titleLabel.text = "Choose Options"
                    
                }
                    
                else {
                    
                    self.optionsDrawerView.titleLabel.text = self.options![(self.selectedIndex?.item)!].name
                }
                
                self.optionsDrawerView.collectionView.alpha = 1
                self.optionsDrawerView.titleLabel.alpha = 1
            }, completion: { a in
                self.updatePrice()
            })
            
        }
        
        self.insideOptionValues = !self.insideOptionValues
    }
}

extension OptionsLauncher: QuantityDelegate {
    func quantityUpdated() {
        updatePrice()
    }
}
