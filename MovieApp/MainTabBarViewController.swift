//
//  ViewController.swift
//  MovieApp
//
//  Created by bernardus kanayari on 26/03/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red

    /// Initialaze every ViewController for TabBar
    let HomeVC = UINavigationController(rootViewController: HomeViewController())
    let UpComingVC = UINavigationController(rootViewController: UpComingViewController())
    let SearchVC = UINavigationController(rootViewController: SearchViewController())
    let DownloadVC = UINavigationController(rootViewController: DownloadViewController())

    /// SettingUp TabBar Img
    HomeVC.tabBarItem.image = UIImage(systemName: "house.fill")
    UpComingVC.tabBarItem.image = UIImage(systemName: "play.circle.fill")
    SearchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    DownloadVC.tabBarItem.image = UIImage(systemName: "arrow.down.circle.fill")

    /// SettingUp TabBar Title
    HomeVC.tabBarItem.title = "Home"
    UpComingVC.tabBarItem.title = "Coming Soon"
    SearchVC.tabBarItem.title = "Search"
    DownloadVC.tabBarItem.title = "Download"

    /// Setting up for tabBarIcon Color
    tabBar.tintColor = .label

    /// Setting the navigation
    setViewControllers([HomeVC, UpComingVC, SearchVC, DownloadVC], animated: true)
  }
}
