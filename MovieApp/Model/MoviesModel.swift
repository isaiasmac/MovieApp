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
    case mid = "id"
    case movies
    case movie
    case data
    case title
    case coverSmall = "small_cover_image"
    case coverMedium = "medium_cover_image"
    case coverLarge = "large_cover_image"
    case year
    case rating
    case summary
    case url
    case cast
    case name
    case characterName = "character_name"
    case imageSmall = "url_small_image"
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
        //let url = "https://yts.am/api/v2/list_movies.json?limit=\(limit)"
        let url = "\(Constants.API_URL)?limit=\(limit)"
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
    
    func getMovieDetail(movieId: Int, completion: @escaping (Bool, Movie?) -> ()){
        //let url = "https://yts.am/api/v2/movie_details.json?movie_id=\(movieId)&with_cast=true"
        let url = "\(Constants.API_URL_DETAIL_MOVIE)movie_id=\(movieId)"
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value {
                let jsonObj = JSON(json)
                let dataJson = jsonObj[MovieKey.data.rawValue]
                let movieJson = dataJson[MovieKey.movie.rawValue]
                
                let movie = self.parseMovieJson(json: movieJson)
                completion(true, movie)
            }
            else{
                print("Error !! \(String(describing: response.error?.localizedDescription))")
                completion(false, nil)
            }
        }
    }
    
    fileprivate func parseMovieJson(json: JSON) -> Movie {
        let movie = Movie()
        movie.mId = json[MovieKey.mid.rawValue].intValue
        movie.title = json[MovieKey.title.rawValue].stringValue
        movie.coverSmall = json[MovieKey.coverSmall.rawValue].stringValue
        movie.coverMedium = json[MovieKey.coverMedium.rawValue].stringValue
        movie.coverLarge = json[MovieKey.coverLarge.rawValue].stringValue
        movie.year = json[MovieKey.year.rawValue].intValue
        movie.rating = json[MovieKey.rating.rawValue].double
        movie.summary = json[MovieKey.summary.rawValue].string
        movie.torrentUrl = json[MovieKey.url.rawValue].string
        
        if let castJson = json[MovieKey.cast.rawValue].array {
            print("castJSON: \(castJson)")
            var castArray: [Cast] = []
            for c in castJson{
                let name = c[MovieKey.name.rawValue].stringValue
                let characterName = c[MovieKey.characterName.rawValue].stringValue
                let imageSmall = c[MovieKey.imageSmall.rawValue].string
                let cast = Cast(name: name, characterName: characterName)
                cast.imageSmall = imageSmall
                castArray.append(cast)
            }
            
            movie.cast = castArray
        }
        
        return movie
    }
    
    fileprivate func parseMoviesJson(json: [JSON]) -> [Movie] {
        var movies: [Movie] = []
        for m in json {
            let movie = self.parseMovieJson(json: m)
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
