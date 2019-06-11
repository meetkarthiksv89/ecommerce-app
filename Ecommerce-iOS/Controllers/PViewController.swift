//
//  PViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/2/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class PViewController: UIViewController {
    
    var header = PNavBarView(frame: .zero)
    
    var contentView: UIView = {
       let view = UIView(frame: .zero)
       view.backgroundColor = UIColor.brandBrown
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    var footer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.brandBrown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerHeightConstraint =  NSLayoutConstraint()
    var footerHeightConstraint = NSLayoutConstraint()
    
    
    
    @objc func backButtonTapped() {
         navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brandBrown
        header.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(header)
        view.addSubview(contentView)
        view.addSubview(footer)
        
        let views: [String:Any] = [
            "headerView":header,
            "footerView":footer,
            "contentView":contentView
        ]
        var constraints: [NSLayoutConstraint] = []
        
        headerHeightConstraint = header.heightAnchor.constraint(equalToConstant: view.frame.height/3)
        view.addConstraint(headerHeightConstraint)
        
        footerHeightConstraint = footer.heightAnchor.constraint(equalToConstant: 40)
        view.addConstraint(footerHeightConstraint)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[headerView]-0-[contentView]-0-[footerView]-0-|", metrics: nil, views: views)
        
        constraints += verticalConstraints
        
        view.addConstraint(NSLayoutConstraint(item: footer, attribute: .height, relatedBy: .equal, toItem: footer, attribute: .height, multiplier: 1, constant: 40))
        
        let horizontalHeaderViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[headerView]-0-|", metrics: nil, views: views)
        
        constraints += horizontalHeaderViewConstraints
        
        let horizontalcontentViewConstraints =   NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentView]-0-|", metrics: nil, views: views)
        
        constraints += horizontalcontentViewConstraints
        
        let horizontalFooterViewContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[footerView]-0-|", metrics: nil, views: views)
        
        constraints += horizontalFooterViewContraints
        
        NSLayoutConstraint.activate(constraints)
        

        // Do any additional setup after loading the view.
    }
    
}
