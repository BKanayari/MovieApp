//
//  UpComingViewController.swift
//  MovieApp
//
//  Created by bernardus kanayari on 26/03/24.
//

import UIKit

class UpComingViewController: UIViewController {

  private var upcomingTable: UITableView = {
    let table = UITableView()
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
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
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    upcomingTable.frame = view.bounds
  }

  private func configureNavBar() {

  }
}

extension UpComingViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
    cell.textLabel?.text = "test"
    return cell
  }
  

}
