//
//  TitleCollectionViewCell.swift
//  MovieApp
//
//  Created by bernardus kanayari on 29/04/24.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {

  static let identifier = "TitleCollectionViewCell"

  /// Creating component
  private let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: CGRect())
    contentView.addSubview(posterImageView)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    posterImageView.frame = contentView.bounds
  }

  public func configure(with model: String) {
    guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {return} /// Getting the poster image from API
    posterImageView.sd_setImage(with: url, completed: nil)
  }
}
