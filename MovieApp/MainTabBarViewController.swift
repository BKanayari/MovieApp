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
        HomeVC.tabBarItem.selectedImage = UIImage(named: "house.fill")
        UpComingVC.tabBarItem.selectedImage = UIImage(named: "play.circle.fill")
        SearchVC.tabBarItem.selectedImage = UIImage(named: "magnifyingglass")
        DownloadVC.tabBarItem.selectedImage = UIImage(named: "arrow.down.circle.fill")

        /// SettingUp TabBar Title
        HomeVC.tabBarItem.title = "Home"
        UpComingVC.tabBarItem.title = "Coming Soon"
        SearchVC.tabBarItem.title = "Search"
        DownloadVC.tabBarItem.title = "Download"

        /// Setting the navigation
        setViewControllers([HomeVC, UpComingVC, SearchVC, DownloadVC], animated: true)
    }
}
