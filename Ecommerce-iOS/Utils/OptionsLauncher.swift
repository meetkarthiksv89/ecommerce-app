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
    
    
    /// Variable to know the selected option type
    var selectedIndex: IndexPath?
    
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
    }
    
    
    
    /// Show draw
    ///
    /// - Parameter withOptions: <#withOptions description#>
    func showOptionsDrawView(withOptions: [Option]) {
        
        options = withOptions
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleOptionsDismiss)))
        
            
            window.addSubview(blackView)
            window.addSubview(optionsDrawerView)
            
            optionsDrawerView.options = withOptions
            
            let height: CGFloat = 320
            let y = window.frame.height - height
            optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height
                , width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.optionsDrawerView.frame = CGRect(x: 0, y: y, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    @objc func handleOptionsDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.optionsDrawerView.frame = CGRect(x: 0, y: window.frame.height, width: self.optionsDrawerView.frame.width, height: self.optionsDrawerView.frame.height)
            }
        }, completion: nil)
    }
    
    func updatePrice() {
        
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
            self.updatePrice()
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
                
            })
            
        }
        
        self.insideOptionValues = !self.insideOptionValues
        
        
    }
    
    
}
