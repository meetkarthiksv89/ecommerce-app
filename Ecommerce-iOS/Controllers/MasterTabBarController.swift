//
//  MasterTabBarController.swift
//  Ecommerce-iOS
//
//  Created by Karthik Venkatesh on 7/21/19.
//  Copyright © 2019 Karthik Venkatesh. All rights reserved.
//

import UIKit

class MasterTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setupTabBar() {
        let productViewController = UINavigationController(rootViewController: ProductsViewController())
        productViewController.tabBarItem.image = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        productViewController.tabBarItem.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
       productViewController.tabBarItem.title = "Shop"
        productViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        productViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brandYellow], for: .highlighted)
        
        
        let accountViewController = UINavigationController(rootViewController: AccountViewController())
        accountViewController.tabBarItem.image = UIImage(named: "profile_icon")?.withRenderingMode(.alwaysOriginal)
        accountViewController.tabBarItem.selectedImage = UIImage(named: "profile_icon_selected")?.withRenderingMode(.alwaysOriginal)
        accountViewController.tabBarItem.title = "Profile"
        accountViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        accountViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.brandYellow], for: .highlighted)
        
        tabBar.barTintColor = UIColor.brandBrown
        tabBar.isTranslucent = true
        viewControllers = [productViewController,accountViewController]

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
