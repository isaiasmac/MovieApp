//
//  AppDelegate.swift
//  MovieApp
//
//  Created by Isaías on 5/11/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

      
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navBarAppearace = UINavigationBar.appearance()
        navBarAppearace.tintColor = Constants.GLOBAL_COLOR
        navBarAppearace.shadowImage = UIImage()
        //navBarAppearace.isTranslucent = false
        navBarAppearace.backgroundColor = Constants.GLOBAL_COLOR
        //navBarAppearace.setBackgroundImage(UIImage(), for: .default)
        
        return true
    }


}

