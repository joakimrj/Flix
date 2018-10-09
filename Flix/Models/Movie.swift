//
//  Movie.swift
//  Flix
//
//  Created by Joakim Jorde on 10/9/18.
//  Copyright © 2018 Joakim Jorde. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var overview: String?
    var posterUrl: URL?
    var backdropUrl: URL?
    var releaseDate: String?
    var rate: String?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        
        if let rate = dictionary["vote_average"] as? NSNumber{
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimumFractionDigits = 1
            nf.maximumFractionDigits = 1
            let rater = nf.string(from: rate)!
            self.rate = "Rate: \(rater)/10"
        }
        // Set the rest of the properties
        
       // static let backdropPath = "backdrop_path"
        let backdropPathString = dictionary["backdrop_path"] as? String ?? ""
        let posterPathString = dictionary["poster_path"] as? String ?? ""
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        posterUrl = URL(string: baseURLString + posterPathString)!
        backdropUrl = URL(string: baseURLString + backdropPathString)!

    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
