//
//  SignUpViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {


    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        name.attributedPlaceholder = NSAttributedString(string: "Name",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: Int(0.4))])
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: Int(0.4))])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: Int(0.4))])
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
