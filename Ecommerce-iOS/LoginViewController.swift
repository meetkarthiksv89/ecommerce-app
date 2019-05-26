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
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F)])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F)])

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 0.4)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
