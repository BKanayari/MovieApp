//
//  APICaller.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

struct Constants {
  static let API_KEY = "3a71a6952e55d4d9db72daf19b1bf0f4"
  static let baseURL = "https://api.themoviedb.org/"
}

enum APIError: Error {
  case failedToGetData
}

class APICaller {
  static let shared = APICaller()

  /// To get the data from the API
  func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
    
    guard let url = URL(string: "\(Constants.baseURL)3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }
}
