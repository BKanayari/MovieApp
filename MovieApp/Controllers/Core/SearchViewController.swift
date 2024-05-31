//
//  SearchViewController.swift
//  MovieApp
//
//  Created by bernardus kanayari on 26/03/24.
//

import UIKit

class SearchViewController: UIViewController {

  private var titles: [Title] = [Title]()

  private var searchController: UISearchController = {
    let controller = UISearchController(searchResultsController: SearchResultViewController())
    controller.searchBar.placeholder = "Search for Movie or a TV show"
    controller.searchBar.searchBarStyle = .minimal
    return controller
  }()

  private var discoverTable: UITableView = {
    let table = UITableView()
    table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationItem.largeTitleDisplayMode = .never

    view.addSubview(discoverTable)

    discoverTable.delegate = self
    discoverTable.dataSource = self

    navigationItem.searchController = searchController
    navigationController?.navigationBar.tintColor = .white

    fetchDiscoverMovies()

    searchController.searchResultsUpdater = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    discoverTable.frame = view.bounds
  }

  private func fetchDiscoverMovies() {
    APICaller.shared.getDiscoverMovie { [ weak self ] result in
      switch result {
      case .success(let titles):
        self?.titles = titles
        DispatchQueue.main.async {
          self?.discoverTable.reloadData()
        }

      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as?
            TitleTableViewCell else {
      return UITableViewCell()
    }

    cell.configure(with: TitleViewModel(posterURL: titles[indexPath.row].poster_path ?? "Unknown", titleName: titles[indexPath.row].original_title ?? ""))

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}

extension SearchViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar

    guard let query = searchBar.text,
          !query.trimmingCharacters(in: .whitespaces).isEmpty,
          query.trimmingCharacters(in: .whitespaces).count >= 3,
          let resultController = searchController.searchResultsController as? SearchResultViewController else {return}

    APICaller.shared.getSearchResult(with: query) { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let titles):
          resultController.titles = titles
          resultController.searchResultCollectionView.reloadData()
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
