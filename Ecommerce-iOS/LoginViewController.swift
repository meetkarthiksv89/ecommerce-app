//
//  LoginViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/25/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.attributedPlaceholder = NSAttributedString(string: "Username",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: Int(0.4))])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: Int(0.4))])

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        navigationController?.present(ProductsViewController(), animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}


