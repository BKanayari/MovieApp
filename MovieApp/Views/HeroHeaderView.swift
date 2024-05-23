//
//  HeroHeaderView.swift
//  MovieApp
//
//  Created by bernardus kanayari on 15/04/24.
//

import UIKit

class HeroHeaderView: UIView {

  private var heroImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "heroImg")
    return imageView
  }()

  private var playButton: UIButton = {
    let playButton = UIButton()
    playButton.setTitle("Play", for: .normal)
    playButton.layer.borderColor = UIColor.white.cgColor
    playButton.layer.borderWidth = 1
    playButton.layer.cornerRadius = 5
    playButton.translatesAutoresizingMaskIntoConstraints = false
    return playButton
  }()

  private var downloadButton: UIButton = {
    let downloadButton = UIButton()
    downloadButton.setTitle("Download", for: .normal)
    downloadButton.layer.borderColor = UIColor.white.cgColor
    downloadButton.layer.borderWidth = 1
    downloadButton.layer.cornerRadius = 5
    downloadButton.translatesAutoresizingMaskIntoConstraints = false
    return downloadButton
  }()

  private func addGradient() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = bounds
    gradientLayer.colors = [
      UIColor.clear.cgColor,
      UIColor.systemBackground.cgColor
    ]
    layer.addSublayer(gradientLayer)
  }

  private func applyConstraints() {
    /// Setting Constraint for playButton
    let playButtonConstrains = [
      playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
      playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      playButton.widthAnchor.constraint(equalToConstant: 100)
    ]

    /// Setting Constraint for downloadButton
    let downloadButtonConstraints = [
      downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
      downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      downloadButton.widthAnchor.constraint(equalToConstant: 100)
    ]

    NSLayoutConstraint.activate(playButtonConstrains)
    NSLayoutConstraint.activate(downloadButtonConstraints)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(heroImageView)
    layoutSubviews()
    addGradient()
    addSubview(playButton)
    addSubview(downloadButton)
    applyConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    heroImageView.frame = bounds
  }
}
