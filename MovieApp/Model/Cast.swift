//
//  Cast.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation

class Cast: NSObject {
    var name: String
    var characterName: String
    var imageSmall: String?
    var imdbCode: Int?
    
    init(name: String, characterName: String) {
        self.name = name
        self.characterName = characterName
    }
}
