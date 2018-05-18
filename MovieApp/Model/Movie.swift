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
    var runtime: Int?
    var genres: [String]?
    var summary: String?
    var coverSmall: String?
    var coverMedium: String?
    var coverLarge: String?
    var youtubeTrailerUrl: String?
    var torrentUrl: String?
    var cast: [Cast]?
    
    override var description: String{
        return "Title: \(title))"
    }
    
    func getStrRating() -> String{
        if let rating = self.rating{
            return String(format: "%.1f", rating)
        }
        return "--"
    }
}
