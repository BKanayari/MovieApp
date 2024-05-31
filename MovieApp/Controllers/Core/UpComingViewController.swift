//
//  UpComingViewController.swift
//  MovieApp
//
//  Created by bernardus kanayari on 26/03/24.
//

import UIKit

class UpComingViewController: UIViewController {

  private var titles: [Title] = [Title]()

  private var upcomingTable: UITableView = {
    let table = UITableView()
    table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Upcoming"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationItem.largeTitleDisplayMode = .never
    view.addSubview(upcomingTable)

    upcomingTable.delegate = self
    upcomingTable.dataSource = self

    fetchUpcoming()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    upcomingTable.frame = view.bounds
  }

  // Get the upcoming movies from API
  private func fetchUpcoming() {
    APICaller.shared.getUpcomingMovies { [ weak self ] result in
      switch result {
      case .success(let titles):
        self?.titles = titles
        DispatchQueue.main.async {
          self?.upcomingTable.reloadData()
        }

      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

// Set how many title will show by the amount of the title on the list
extension UpComingViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  // Display the Title On the cell
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }

    cell.configure(with: TitleViewModel(posterURL: titles[indexPath.row].poster_path ?? "Unknown", titleName: titles[indexPath.row].original_title ?? ""))

    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}
