//
//  StartUpViewController.swift
//  Panduranga Ecommerce App
//
//  Created by Karthik Venkatesh on 5/25/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class StartUpViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
       
       navigationController?.pushViewController(LoginViewController(), animated: true)
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
