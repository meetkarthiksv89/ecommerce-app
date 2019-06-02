//
//  PInputView.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 6/1/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

protocol PInputViewDelegate {
    func backButtonTapped()
    func buttonTapped(values:[String])
}

class PInputView: UIView {
    
    
    var delegate: PInputViewDelegate?
    
    var placeHolders: [String]?
    
    var secureFieldIndex: Int?
    
    public var buttonTitle: String? {
        get {
            return self.loginButton.titleLabel?.text
        }
        set(title) {
            self.loginButton.setTitle(title, for: .normal)
        }
    }
    
    var titleText: String? {
        get {
            return navBar.title.text
        }
        set(newText) {
            navBar.title.text = newText
        }
    }
    
    var navBar = PNavBarView(frame: .zero)
    fileprivate var cellId = "PInputCellId"
    
    var noOfTextFields: Int?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PInputFieldCell.self, forCellWithReuseIdentifier: "PInputCellId")
        return cv
    }()
    
    var loginButton = PButton(type: .yellow)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add a background color
        // Add a navbar
        // Add a collection view
        // Add buttons
        // Add constriants
        
        self.backgroundColor = UIColor.brandBrown
        addSubview(navBar)
        addSubview(collectionView)
        addSubview(loginButton)
        addConstraints()
        
    }
    
    convenience init(frame: CGRect, noOfTextField: Int, title: String, buttonTitleText: String?, placeHolder: [String]?) {
        self.init(frame: frame)
        
        noOfTextFields = noOfTextField
        titleText = title
        placeHolders = placeHolder
        buttonTitle = buttonTitleText
        
        collectionView.dataSource = self
        collectionView.delegate = self
        navBar.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    fileprivate func addConstraints() {
        let views = [
            "navBar":navBar,
            "collectionView": collectionView,
            "loginButton" : loginButton
        ]
        
        var constrains: [NSLayoutConstraint] = []
        
        
        // Nav Bar Constraints
        let navBarHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[navBar]-0-|", metrics: nil, views: views)
        addConstraint(NSLayoutConstraint(item: navBar, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.33, constant: 0))
        constrains += navBarHorizontal
        
        
        //Collection View Constraints
        let collectionViewHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[collectionView]-15-|", metrics: nil, views: views)
        constrains += collectionViewHorizontal
        
        // View vertical constraints
        let verticalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[navBar]-30-[collectionView]-20-[loginButton(50)]-30-|", metrics: nil, views: views)
        
        // Button constraints
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.5, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        
        constrains += verticalConstrains
        NSLayoutConstraint.activate(constrains)
    }
    
    func errorAtTextField(atIndex: Int) {
        if let cell = collectionView.cellForItem(at: IndexPath(row: atIndex, section: 0)) as? PInputFieldCell {
            cell.textField.shake(duration: 1.0)
        }
    }
    
    @objc func backButtonTapped() {
        
        if let delegate = delegate {
            delegate.backButtonTapped()
        }
    }
    
    @objc func buttonTapped() {
        
        var textFieldTexts:[String] = []
        if let noOfTextFields = noOfTextFields {
            for i in 0..<noOfTextFields {
                let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as! PInputFieldCell
                textFieldTexts.append(cell.textField.text ?? "")
            }
        }
        
        if let delegate = delegate {
            delegate.buttonTapped(values: textFieldTexts)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PInputView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfTextFields ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PInputFieldCell {
            cell.textField.placeholderText = placeHolders?[indexPath.row]
            if let secure = secureFieldIndex {
                if secure == indexPath.row {cell.textField.secureField =  true}
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
}
