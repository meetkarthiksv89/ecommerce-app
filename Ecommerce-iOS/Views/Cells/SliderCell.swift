//
//  SliderCell.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Slider Cell Failed")
    }
}






















//class OptionsCell: SliderCell {
//    
//    let optionType:UILabel = {
//        let rect = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width:50, height:50))
//        var label = UILabel()
//        label.text = "Coffee Type"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "Avenir", size: 16)!
//        return label
//    }()
//    
//    let optionValue:UILabel = {
//        let label = UILabel()
//        label.text = "With Chicory"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont(name: "Avenir-Medium", size: 16)!
//        return label
//    }()
//    
//    let slider: UISlider = {
//        let slider = UISlider()
//        slider.minimumValue = 0
//        slider.maximumValue = 10
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        slider.tintColor = UIColor(rgb: 0x3A1500, alpha: 1)
//        slider.thumbTintColor = UIColor(rgb: 0xE8A94F, alpha: 1)
//        return slider
//    }()
//    
//    fileprivate func addConstraints() {
//        let views: [String: Any] = [
//            "optionType": optionType,
//            "optionValue": optionValue,
//            "slider":slider]
//        
//        var allConstraints: [NSLayoutConstraint] = []
//        
//        
//        let optionTypeVertical = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-10-[optionType]",
//            metrics: nil,
//            views: views)
//        allConstraints += optionTypeVertical
//        
//        let optionValueVertical = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-10-[optionValue]",
//            metrics: nil,
//            views: views)
//        allConstraints += optionValueVertical
//        
//        let optionsHorizontal = NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|-10-[optionType]-[optionValue]-10-|",
//            metrics: nil,
//            views: views)
//        allConstraints += optionsHorizontal
//        
//        let sliderVertical = NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|-10-[optionValue]-5-[slider]",
//            metrics: nil,
//            views: views)
//        allConstraints += sliderVertical
//        
//        let sliderHorizontal = NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|-10-[slider]-10-|",
//            metrics: nil,
//            views: views)
//        allConstraints += sliderHorizontal
//        
//        NSLayoutConstraint.activate(allConstraints)
//    }
//    
//    override func setupViews() {
//        super.setupViews()
//       
//        
//        addSubview(optionType)
//        addSubview(optionValue)
//        addSubview(slider)
//        
//        addConstraints()
//    }
//}
