//
//  CartDrawerView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit


protocol CartDelegate {
    func checkoutButtonClicked()
}

class CartDrawerView: DrawerView {
    
    var cartDelegate: CartDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let hv = CartHeaderView(frame: headerView.frame)
        headerView.addSubview(hv)
        addConstraint(headerView.heightAnchor.constraint(equalToConstant: 50))
        
        
        let fv = CartFooterView(frame: footerView.frame)
        fv.checkoutButton.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)
        footerView.addSubview(fv)
        addConstraint(footerView.heightAnchor.constraint(equalToConstant: 100))
        
        
        let views: [String: Any] = [
            "hv":hv,
            "fv":fv,
            
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let hvHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[hv]-0-|", metrics: nil, views: views)
        
        allConstraints += hvHorizontal
        
        let hvVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[hv]-0-|", metrics: nil, views: views)
        
        allConstraints += hvVertical
        
        let fvHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[fv]-0-|", metrics: nil, views: views)
        
        allConstraints += fvHorizontal
        
        let fvVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[fv]-0-|", metrics: nil, views: views)
        
        allConstraints += fvVertical
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checkoutButtonTapped() {
        if let delegate = self.cartDelegate {
             delegate.checkoutButtonClicked()
        }
    }
    
}

class CartHeaderView: UIView {
    
    
    let headerIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "cart_icon"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Cart"
        label.font = UIFont(name: "Avenir-Heavy", size: 25)!
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.blue
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerIcon)
        addSubview(title)
        
        let views: [String: Any] = [
            "headerIcon":headerIcon,
            "title":title
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        addConstraint(NSLayoutConstraint(item: headerIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        let horizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[headerIcon(50)]-[title]-0-|", metrics: nil, views: views)
        allConstraints += horizontalContraints
        
        let headerIconVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[headerIcon(50)]", metrics: nil, views: views)
        
        
        allConstraints += headerIconVertical
        
        let titleVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[title(50)]", metrics: nil, views: views)
        
        allConstraints += titleVertical
        
        NSLayoutConstraint.activate(allConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CartFooterView: UIView {
    
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.text = "₹122500"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 25)!
        return label
    }()
    
    let totalText: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 16)!
        return label
    }()
    
    var checkoutButton = PButton(type: .yellow)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = UIColor.red
        self.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.setTitle("Checkout", for: .normal)
        addSubview(checkoutButton)
        
        addConstraint(NSLayoutConstraint(item: checkoutButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width , multiplier: 0.5, constant: 0))
        
        addConstraint(checkoutButton.heightAnchor.constraint(equalToConstant: 50))
        
        addConstraint(NSLayoutConstraint(item: checkoutButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
    
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing;
        stackView.alignment = .trailing;
        stackView.spacing = 0;
        stackView.addArrangedSubview(totalText)
        stackView.addArrangedSubview(productPrice)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        let views: [String: Any] = [
            "checkoutButton":checkoutButton,
            "stackView":stackView
        ]
        
        var constraints: [NSLayoutConstraint] = []
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[stackView]-10-|", metrics: nil, views: views)
        
        constraints += horizontalConstraints
        
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
