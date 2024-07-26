//
//  YoutubeSearchResponse.swift
//  MovieApp
//
//  Created by bernardus kanayari on 07/06/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
  let items: [VideoElement]
}

struct VideoElement: Codable {
  let id: IdVideoElement
}

struct IdVideoElement: Codable {
  let kind: String
  let videoId: String
}

