//
//  PNavBarView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/31/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class PNavBarView: UIView {
    
    fileprivate var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "nav_image"))
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.brandBrown
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir", size: 25)!
        return label
    }()
    
    var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var navButton: UIButton = {
        let button = UIButton(frame: .zero)
        //button.setImage(UIImage(named: "cart_brown_icon"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(title)
        addSubview(backButton)
        addSubview(navButton)
        addViewContraints()
    }
    
    @objc func buttonAction() {
        
    }
    
    func addViewContraints() {
        let views = [
            "imageView":imageView,
            "title": title,
            "backButton":backButton,
            "navButton":navButton
        ]
        
        var imageConstrains: [NSLayoutConstraint] = []
        
        let imageHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[imageView]-0-|", metrics: nil, views: views)
        let imageVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imageView]-0-|", metrics: nil, views: views)
        
        let titleHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[title]-0-|", metrics: nil, views: views)
        let titleVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:[title]-30-|", metrics: nil, views: views)
        
        let backButtonHorizonal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backButton(30)]", metrics: nil, views: views)
        let backButtonVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[backButton(30)]", metrics: nil, views: views)
        
        let navButtonHorizonal = NSLayoutConstraint.constraints(withVisualFormat: "H:[navButton(40)]-20-|", metrics: nil, views: views)
        let navButtonVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[navButton(40)]", metrics: nil, views: views)
        
        
        imageConstrains += titleHorizontal
        imageConstrains += titleVertical
        imageConstrains += imageHorizontalConstraint
        imageConstrains += imageVerticalConstraint
        imageConstrains += backButtonHorizonal
        imageConstrains += backButtonVertical
        imageConstrains += navButtonHorizonal
        imageConstrains += navButtonVertical
        
        

        NSLayoutConstraint.activate(imageConstrains)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
