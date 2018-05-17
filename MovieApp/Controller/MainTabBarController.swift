//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Isaías on 5/16/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor(red:0.84, green:0.09, blue:0.16, alpha:1.0)
        
        self.tabBar.barTintColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
        self.tabBar.isTranslucent = false
        
        let moviesTabBarItem = (self.tabBar.items?[0])! as UITabBarItem
        moviesTabBarItem.image = #imageLiteral(resourceName: "Movies_icon_default").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        moviesTabBarItem.selectedImage = #imageLiteral(resourceName: "Movies_icon").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        moviesTabBarItem.title = NSLocalizedString("Movies", comment: "")
        //moviesTabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let tvTabBarItem = (self.tabBar.items?[1])! as UITabBarItem
        tvTabBarItem.image = #imageLiteral(resourceName: "TV_icon_default").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tvTabBarItem.selectedImage = #imageLiteral(resourceName: "TV_icon").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tvTabBarItem.title = NSLocalizedString("TV", comment: "")
        
        let profileTabBarItem = (self.tabBar.items?[2])! as UITabBarItem
        profileTabBarItem.image = #imageLiteral(resourceName: "Profile_icon_default").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        profileTabBarItem.selectedImage = #imageLiteral(resourceName: "Profile_icon").withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        profileTabBarItem.title = NSLocalizedString("Profile", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if UserDefaults.standard.showWalkthroughScreen() == false {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let walkthroughVC = mainStoryboard.instantiateViewController(withIdentifier: "WalkthroughVCID") as! WalkthroughVC
            
            self.present(walkthroughVC, animated: false, completion: {
                UserDefaults.standard.setShowWalkthorughScreen()
            })
        }
    }

}
