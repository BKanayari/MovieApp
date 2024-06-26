//
//  SearchResultViewController.swift
//  MovieApp
//
//  Created by bernardus kanayari on 28/05/24.
//

import UIKit

class SearchResultViewController: UIViewController {

  public var titles: [Title] = [Title]()

  public let searchResultCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 20, height: 200)
    layout.minimumInteritemSpacing = 0

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    view.addSubview(searchResultCollectionView)

    searchResultCollectionView.delegate = self
    searchResultCollectionView.dataSource = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    searchResultCollectionView.frame = view.bounds
  }
}

extension SearchResultViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
      return UICollectionViewCell()
    }

    let title = titles[indexPath.row]
    cell.configure(with: title.poster_path ?? "")
    return cell
  }
}
