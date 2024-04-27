//
//  APICaller.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

struct Constants {
  static let API_KEY = "3a71a6952e55d4d9db72daf19b1bf0f4"
  static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
  static let shared = APICaller()

  /// To get the data from the API
  func getTrendingMovies(completion: @escaping (String) -> Void) {
    
    guard let url = URL(string: "\(Constants.baseURL)3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        print(results)
      } catch {
        print(error.localizedDescription)
      }
    }
    task.resume()
  }
}
