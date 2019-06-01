//
//  SignUpViewController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 5/26/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordValidationLabel: UILabel!
    var isPasswordValid = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        password.delegate = self
        password.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
//        passwordValidationLabel.text = "Password must be at least 8 characters, and contain at least one upper case letter, one lower case letter, and one number."
//        passwordValidationLabel.textColor = UIColor.brandYellow
        
        // Do any additional setup after loading the view.
        
        name.attributedPlaceholder = NSAttributedString(string: "Name",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: 0.4)])
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: 0.4)])
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xE8A94F, alpha: 0.4)])
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        guard let email = email.text else { return }
        guard let password = password.text else { return }
        guard let username = name.text else { return }
        
        createUser(withEmail: email, password: password, username: username)
    }
    
    func createUser(withEmail email: String, password: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign user up with error: ", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
                }
                
                guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
                guard let controller = navController.viewControllers[0] as? ProductsViewController else { return }
                controller.configureViewComponents()                
                self.dismiss(animated: true, completion: nil)
            })
            
        }
        
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
    
    func setupAttributeColor(if isValid: Bool) -> [NSAttributedString.Key: Any] {
        if isValid {
            return [NSAttributedString.Key.foregroundColor: UIColor.green]
            
        } else {
            isPasswordValid = false
            return [NSAttributedString.Key.foregroundColor: UIColor.red]
        }
    }
    
    func findRange(in baseString: String, for substring: String) -> NSRange {
        if let range = baseString.localizedStandardRange(of: substring) {
            let startIndex = baseString.distance(from: baseString.startIndex, to: range.lowerBound)
            let length = substring.count
            return NSMakeRange(startIndex, length)
        } else {
            print("Range does not exist in the base string.")
            return NSMakeRange(0, 0)
        }
    }

    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let attrStr = NSMutableAttributedString (
            string: "Password must be at least 8 characters, and contain at least one upper case letter, one lower case letter, and one number.",
            attributes: [
                .font: UIFont.init(name: "Roboto", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0),
                .foregroundColor: UIColor.brandYellow
            ])

        if let txt = password.text {
            isPasswordValid = true
            attrStr.addAttributes(setupAttributeColor(if: (txt.count >= 8)),
                                  range: findRange(in: attrStr.string, for: "at least 8 characters"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil)),
                                  range: findRange(in: attrStr.string, for: "one upper case letter"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil)),
                                  range: findRange(in: attrStr.string, for: "one lower case letter"))
            attrStr.addAttributes(setupAttributeColor(if: (txt.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil)),
                                  range: findRange(in: attrStr.string, for: "one number"))
        } else {
            isPasswordValid = false
        }

        passwordValidationLabel.attributedText = attrStr
    }

}
