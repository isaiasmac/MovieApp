//
//  MoviesModel.swift
//  MovieApp
//
//  Created by Isaías on 5/17/18.
//  Copyright © 2018 IsaiasMac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum MovieKey: String {
    case mid
    case movies
    case data
    case title
    case coverSmall = "small_cover_image"
    case coverMedium = "medium_cover_image"
    case coverLarge = "large_cover_image"
    case year
    case rating
}

class MoviesModel{
    
    func getMoviesOffline(completion: (Bool, [Movie]?) -> ()){
        if let path = Bundle.main.path(forResource: MovieKey.movies.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                let dataJson = jsonObj[MovieKey.data.rawValue]
                let moviesJson = dataJson[MovieKey.movies.rawValue]
                
                let movies = self.parseMoviesJson(json: moviesJson.arrayValue)
                completion(true, movies)
            }
            catch{
                print("parse error: \(error.localizedDescription)")
                completion(false, nil)
            }
        }
        else{
            completion(false, nil)
        }
    }
    
    func getMoviesOnline(limit: Int = 1, completion: @escaping (Bool, [Movie]?) -> ()) {
        let url = "https://yts.am/api/v2/list_movies.json?limit=\(limit)"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                let jsonObj = JSON(json)
                let dataJson = jsonObj[MovieKey.data.rawValue]
                let moviesJson = dataJson[MovieKey.movies.rawValue]
                
                let movies = self.parseMoviesJson(json: moviesJson.arrayValue)
                completion(true, movies)
            }
            else{
                completion(false, nil)
            }
        }
    }
    
    fileprivate func parseMoviesJson(json: [JSON]) -> [Movie]{
        var movies: [Movie] = []
        for m in json {
            let movie = Movie()
            movie.mId = m[MovieKey.mid.rawValue].intValue
            movie.title = m[MovieKey.title.rawValue].stringValue
            movie.cover_small = m[MovieKey.coverSmall.rawValue].stringValue
            movie.cover_medium = m[MovieKey.coverMedium.rawValue].stringValue
            movie.cover_large = m[MovieKey.coverLarge.rawValue].stringValue
            movie.year = m[MovieKey.year.rawValue].intValue
            movie.rating = m[MovieKey.rating.rawValue].doubleValue
            
            movies.append(movie)
        }
        
        return movies
    }
    
    // Solo 6 peliculas >= 8 en rating
    func findPopular(movies: [Movie]) -> [Movie]{
        let moviesPopular = movies.filter({ $0.rating! >= 7.8 })
        
        if moviesPopular.count > 6 {
            return Array(moviesPopular.prefix(6))
        }
        
        return moviesPopular
    }
    
    
    
}
