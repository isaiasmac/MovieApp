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
        print("viewDidLoad here !")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear here !")
        
        // WalkthroughVCID
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let walkthroughVC = mainStoryboard.instantiateViewController(withIdentifier: "WalkthroughVCID") as! WalkthroughVC
        
        self.present(walkthroughVC, animated: false, completion: {
            print("Complete Present")
        })
    }

    

}
