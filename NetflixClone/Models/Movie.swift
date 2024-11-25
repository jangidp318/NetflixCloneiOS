//
//  Movie.swift
//  NetflixClone
//
//  Created by Sharmaji on 18/11/24.
//

import Foundation

struct TrendingMovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_title: String?
    let original_name: String?
    let poster_path: String
    let overview: String
    let vote_count: Int
    let first_air_date: String?
    let release_date: String
    let vote_average: Double
}
