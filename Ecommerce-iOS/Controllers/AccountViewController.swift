//
//  AccountViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/21/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOutButtonTapped(_ sender: Any) {
        signOut()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            let loginViewController = LoginViewController()
            loginViewController.hideBackButton()
            self.present(loginViewController, animated: true, completion: nil)
        } catch let error {
            print("Failed to sign out with error..", error)
        }
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
