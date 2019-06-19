//
//  InfoViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/2/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class CheckoutViewController: PViewController, CartDelegate {
    func checkoutButtonClicked() {
        cartLauncher.handleCartDismiss()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.title.text = "Checkout"
        header.navButton.setImage(UIImage(named: "cart_brown_icon"), for: .normal)
        header.navButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        addUserInfo()
    }
    
    let cartLauncher = ProductOptionsLauncher()
    
    @objc func cartButtonTapped() {
        cartLauncher.showCartDrawView()
        cartLauncher.cartDrawerView.cartDelegate = self
    }
    
    let yourInfo: UILabel = {
        let label = UILabel()
        label.text = "Your Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Avenir-Heavy", size: 25)!
        return label
    }()
    
    let editIcon: UIButton = {
       let button = UIButton()
       button.setImage(UIImage(named: "edit_icon"), for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView = UIStackView()
    
    fileprivate func addYourLabelAndEditIcon() {
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing;
        stackView.alignment = .trailing;
        stackView.spacing = 0;
        stackView.addArrangedSubview(yourInfo)
        stackView.addArrangedSubview(editIcon)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addConstraint(editIcon.heightAnchor.constraint(equalToConstant: 40))
        stackView.addConstraint(editIcon.widthAnchor.constraint(equalToConstant: 40))
        
        contentView.addSubview(stackView)
        
        let views: [String: Any] = [
            "stackView":stackView,
            "headerView":header
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let horizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[stackView]-20-|", metrics: nil, views: views)
        allConstraints += horizontalContraints
        
        let headerIconVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[headerView]-10-[stackView]", metrics: nil, views: views)
        
        allConstraints += headerIconVertical
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    
    let payNowButton = PButton(type: .yellow)
    
    fileprivate func addPayNowButton() {
        payNowButton.setTitle("Pay Now", for: .normal)
        footer.addSubview(payNowButton)
        footer.addConstraint(NSLayoutConstraint(item: payNowButton, attribute: .centerX, relatedBy: .equal, toItem: footer, attribute: .centerX, multiplier: 1.0, constant: 0))
        footer.addConstraint(payNowButton.heightAnchor.constraint(equalToConstant: 50))
        footer.addConstraint(NSLayoutConstraint(item: payNowButton, attribute: .width, relatedBy: .equal, toItem: footer, attribute: .width , multiplier: 0.5, constant: 0))
    }
    
    fileprivate func addAddressInfo() {
        let infoTableView: UITableView = {
            let tableView = UITableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCellID")
            tableView.backgroundColor = UIColor.clear
            tableView.separatorStyle = .none
            return tableView
        }()
        
        
        contentView.addSubview(infoTableView)
        let views: [String: Any] = [
            "infoTableView":infoTableView,
            "stackView":stackView
            
        ]
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let horizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[infoTableView]-0-|", metrics: nil, views: views)
        allConstraints += horizontalContraints
        
        let headerIconVertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[stackView]-30-[infoTableView]-20-|", metrics: nil, views: views)
        
        allConstraints += headerIconVertical
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    func addUserInfo() {

        addYourLabelAndEditIcon()
        addPayNowButton()
        
        addAddressInfo()
        
        
        
    }

}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCellID", for: indexPath)
        cell.textLabel?.text = "Address"
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 16)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    

}
