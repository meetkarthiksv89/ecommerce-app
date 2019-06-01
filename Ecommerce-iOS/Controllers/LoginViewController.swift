//
//  LoginViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/25/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    fileprivate var userName = PTextField(frame: .zero)
    fileprivate var password = PTextField(frame: .zero)
    fileprivate let navBar = PNavBarView(frame:.zero)
    fileprivate var loginButton = PButton(type: .yellow)
    
    fileprivate func addViewConstraints() {
        let views = [
            "navBar":navBar,
            "userName":userName,
            "password":password,
            "loginButton":loginButton
        ]
        
        var constraints: [NSLayoutConstraint] = []
        
        let imageHorizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[navBar]-0-|", metrics: nil, views: views)
        
        let imageVerticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[navBar]-50-[userName(45)]-30-[password(45)]->=20-[loginButton(45)]-40-|", metrics: nil, views: views)
        
        let userNameHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[userName]-20-|", metrics: nil, views: views)
        
        let passwordHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[password]-20-|", metrics: nil, views: views)
        
        view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0))
        
        constraints += imageHorizontalConstraint
        constraints += imageVerticalConstraint
        constraints += userNameHorizontal
        constraints += passwordHorizontal
        
        NSLayoutConstraint.activate(constraints)
        
        view.addConstraint(NSLayoutConstraint(item: navBar, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.33, constant: 0))
    }
    
    fileprivate func setupView() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.brandBrown
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(navBar)
        view.addSubview(loginButton)
        
        navBar.title.text = "Login"
        
        userName.placeholderText = "Username"
        password.placeholderText = "Password"
        password.textContentType = .password
        password.isSecureTextEntry = true
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        navBar.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func login() {
        
        loginButton.animate()
        guard let email = userName.text else { return }
        
        if !email.isValidEmail {
            userName.shake(duration: 1.0)
        }
        
        if !password.text!.isValidPassword{
            password.shake(duration: 1.0)
        }
        guard let password = password.text else { return }
        
        logUserIn(withEmail: email, password: password)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViewConstraints()
    }

    @objc func backButtonTapped() {

        navigationController?.popViewController(animated: true)
        
    }
    
    func logUserIn(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign user in with error: ", error.localizedDescription)
                self.password.text = ""
                self.password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                self.password.shake(duration: 1.0)
                return
            }
            
            guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            guard let controller = navController.viewControllers[0] as? ProductsViewController else { return }
            controller.configureViewComponents()
            

            self.dismiss(animated: true, completion: nil)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
}


