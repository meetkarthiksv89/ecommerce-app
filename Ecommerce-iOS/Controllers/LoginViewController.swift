//
//  LoginViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/25/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController{
    
    let loginView = PInputView(frame: .zero, noOfTextField: 2, title: "Login",buttonTitleText: "Login",placeHolder: ["Username","Password"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawView()
    }
    
    func drawView(){

        loginView.delegate = self
        loginView.backgroundColor = UIColor.brandBrown
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.secureFieldIndex = 1
        loginView.collectionView.isScrollEnabled = false
        
        view.addSubview(loginView)
        
        var constraints:[NSLayoutConstraint] = []
        
        let loginViewHorizontalContraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[loginView]-0-|", metrics: nil, views: ["loginView":loginView])
        let loginViewVerticalContraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[loginView(40)]|", metrics: nil, views: ["loginView":loginView])
        
        constraints += loginViewHorizontalContraint
        constraints += loginViewVerticalContraint
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func logUserIn(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let _ = error {
//                print("Failed to sign user in with error: ", error.localizedDescription)
//                self.password.text = ""
//                self.password.attributedPlaceholder = NSAttributedString(string: "Password",
//                                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
//                self.password.shake(duration: 1.0)
                return
            }
            
            guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            guard let controller = navController.viewControllers[0] as? ProductsViewController else { return }
            controller.configureViewComponents()
            

            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func login(credentials: [String]) {
        loginView.loginButton.animate()
        let email = credentials[0]
        let password = credentials[1]
        
        if email == "" || !email.isValidEmail {
            loginView.errorAtTextField(atIndex: 0)
            return
        }
        if password == "" {
            loginView.errorAtTextField(atIndex: 1)
            return
        }
        
        logUserIn(withEmail: email, password: password)
    }
}

extension LoginViewController: PInputViewDelegate {
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    func buttonTapped(values: [String]) {
        login(credentials: values)
    }
}



