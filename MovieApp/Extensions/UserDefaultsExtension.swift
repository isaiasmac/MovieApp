//
//  UserDefaultsExtension.swift
//  MovieApp
//
//  Created by Isaías on 5/16/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation

enum WalkthorughKeys: String {
    case isFirstTimeLaunch
}

extension UserDefaults{
    
    func showWalkthroughScreen() -> Bool{
        return self.bool(forKey: WalkthorughKeys.isFirstTimeLaunch.rawValue)
    }
    
    func setShowWalkthorughScreen(){
        self.set(true, forKey: WalkthorughKeys.isFirstTimeLaunch.rawValue)
    }
}
