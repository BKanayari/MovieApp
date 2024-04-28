//
//  Movie.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

struct TrendingMovieResponse: Codable {
  let results: [Movie]
}

struct Movie: Codable {
  let id: Int
  let original_title: String?
  let overview: String?
  let popularity: Double
  let releaser_date: String?
  let title: String?
  let vote_average: Double
}
