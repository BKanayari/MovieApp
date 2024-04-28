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

  // To get the Trending Movies data from the API
  func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
    
    guard let url = URL(string: "\(Constants.baseURL)3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }

  // To get the Trending Tv data from the API
  func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {

    guard let url = URL(string: "\(Constants.baseURL)3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }

  // To get the Popular Movies data from the API
  func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {

    guard let url = URL(string: "\(Constants.baseURL)3/movie/popular?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }

  // To get the Upcoming Movies data from the API
  func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {

    guard let url = URL(string: "\(Constants.baseURL)3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }

  // To get the Top Rated Movies data from the API
  func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {

    guard let url = URL(string: "\(Constants.baseURL)3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let results = try JSONDecoder().decode(TitleResponse.self, from: data)
        completion(.success(results.results))
      } catch {
        completion(.failure(APIError.failedToGetData))
      }
    }
    task.resume()
  }

}
