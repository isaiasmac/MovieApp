//
//  Constant.swift
//  MovieApp
//
//  Created by Isaías on 5/18/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let API_URL = "https://yts.am/api/v2/"
    static let API_URL_LIST_MOVIES = "\(API_URL)list_movies.json"
    static let API_URL_DETAIL_MOVIE = "\(API_URL)movie_details.json?with_cast=true&"
    
    static let GLOBAL_COLOR = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
}
