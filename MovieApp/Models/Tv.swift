//
//  Tv.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

struct TvResponse: Codable {
  let results: [Tv]
}

struct Tv: Codable {
  let id: Int
  let original_title: String?
  let overview: String?
  let popularity: Double
  let releaser_date: String?
  let title: String?
  let vote_average: Double
}
