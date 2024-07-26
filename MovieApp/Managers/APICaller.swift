//
//  APICaller.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/04/24.
//

import Foundation

struct Constants {
  static let API_KEY = "9865abe00dc79ffbb61ad9dcc2e35c75"
  static let baseURL = "https://api.themoviedb.org/"
  static let youtubeAPI_Key = "AIzaSyC8UajlzR9bZHghPdaQvJ5knvk-GKyiQfg"
  static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
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

  // To get the discover movie in the searching view
  func getDiscoverMovie(completion: @escaping (Result<[Title], Error>) -> Void) {

    guard let url = URL(string: "\(Constants.baseURL)3/discover/movie?api_key=\(Constants.API_KEY)") else {return}

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

  // To get search result from API
  func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
    guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(query)&api_key=\(Constants.API_KEY)") else {return}

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
  
  // Get movie json file from Youtube API
  func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
    guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
    guard let url = URL(string: "\(Constants.youtubeBaseURL)q=\(query)&key=\(Constants.youtubeAPI_Key)") else {return}
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {return}
      
      do {
        let result = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
        completion(.success(result.items[0]))
      } catch {
        completion(.failure(error))
        print(error.localizedDescription)
      }
    }
    task.resume()
  }
}
