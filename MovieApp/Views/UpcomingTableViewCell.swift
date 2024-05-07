//
//  UpcomingTableViewCell.swift
//  MovieApp
//
//  Created by bernardus kanayari on 07/05/24.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {

  static let identifier = "UpcomingTableViewCell"

  private let titlesPosterImage: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let playTitleButton: UIButton = {
    let button = UIButton()
    let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
    button.setImage(image, for: .normal)
    button.tintColor = .white
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: UpcomingTableViewCell.identifier)
    contentView.addSubview(titlesPosterImage)
    contentView.addSubview(titleLabel)
    contentView.addSubview(playTitleButton)

    applyConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  private func applyConstraints() {
    let titlesPosterImageConstraints = [
      titlesPosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titlesPosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
      titlesPosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
      titlesPosterImage.widthAnchor.constraint(equalToConstant: 100)
    ]

    let titleLabelConstraints = [
      titleLabel.leadingAnchor.constraint(equalTo: titlesPosterImage.trailingAnchor, constant: 10),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ]

    let playTitleButtonConstraints = [
      playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ]


    NSLayoutConstraint.activate(titlesPosterImageConstraints)
    NSLayoutConstraint.activate(titleLabelConstraints)
    NSLayoutConstraint.activate(playTitleButtonConstraints)
  }

  public func configure(with model: TitleViewModel) {
    guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
    titlesPosterImage.sd_setImage(with: url, completed: nil)
    titleLabel.text = model.titleName
  }
}
