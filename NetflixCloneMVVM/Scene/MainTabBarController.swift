//
//  ViewController.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 22.03.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeVC = HomeViewController()
        let UpcomingVC = UpcomingViewController()
        let SearchVC = SearchViewController()
        let DownloadsVC = DownloadsViewController()
        
//        HomeVC.navigationItem.largeTitleDisplayMode = .always
//        UpcomingVC.navigationItem.largeTitleDisplayMode = .always
//        SearchVC.navigationItem.largeTitleDisplayMode = .always
//        DownloadsVC.navigationItem.largeTitleDisplayMode = .always
        
        let HomeVCNav = UINavigationController(rootViewController: HomeVC)
        let UpcomingVCNav = UINavigationController(rootViewController: UpcomingVC)
        let SearchVCNav = UINavigationController(rootViewController: SearchVC)
        let DownloadsVCNav = UINavigationController(rootViewController: DownloadsVC)

        HomeVCNav.navigationBar.tintColor = .label
        UpcomingVCNav.navigationBar.tintColor = .label
        SearchVCNav.navigationBar.tintColor = .label
        DownloadsVCNav.navigationBar.tintColor = .label
        
        HomeVCNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        UpcomingVCNav.tabBarItem = UITabBarItem(title: "Upcomings", image: UIImage(systemName: "play.circle"), tag: 2)
        SearchVCNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        DownloadsVCNav.tabBarItem = UITabBarItem(title: "Downloads", image: UIImage(systemName: "arrow.down.circle"), tag: 4)
        
        tabBar.tintColor = .label
        
        HomeVCNav.navigationBar.prefersLargeTitles = true
        UpcomingVCNav.navigationBar.prefersLargeTitles = true
        SearchVCNav.navigationBar.prefersLargeTitles = true
        DownloadsVCNav.navigationBar.prefersLargeTitles = true
        
        setViewControllers([HomeVCNav, UpcomingVCNav, SearchVCNav, DownloadsVCNav], animated: false)
    }
    
    
}

