//
//  Movie.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation

class Movie: NSObject {
    var mId: Int = 0
    var title: String = ""
    var year: Int = 0
    var rating: Double?
    var runtime: Int = 0
    var genres: [String] = []
    var summary: String = ""
    var cover_small: String?
    var cover_medium: String?
    var cover_large: String?
    var youtubeTrailerUrl: String?
    
    override var description: String{
        return "Title: \(title), rating: \(rating!)"
    }
}
