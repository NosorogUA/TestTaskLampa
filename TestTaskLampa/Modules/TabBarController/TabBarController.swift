//
//  TabBarController.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 03.11.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UISettings.Color.background
        tabBar.barTintColor = UISettings.Color.black
        tabBar.backgroundColor = UISettings.Color.black
        tabBar.tintColor = UISettings.Color.orange
        tabBar.unselectedItemTintColor = UISettings.Color.white
        setupVC()
    }
    
    private func setupVC() {
        let feedAssembly = FeedAssembly()
        let homeVC = feedAssembly.make(category: MovieCategory.home)
        let favoriteVC = feedAssembly.make(category: MovieCategory.topRated)
        viewControllers = [
            createNavController(for: homeVC, title: Strings.Headers.popular, image: UIImage(systemName: "house")!),
            createNavController(for: favoriteVC, title: Strings.Headers.favorite, image: UIImage(systemName: "star")!)
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.image = image        
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.barTintColor = UISettings.Color.background
        navigationController.navigationBar.topItem?.backButtonDisplayMode = .minimal
        navigationController.navigationBar.tintColor = UISettings.Color.white
        navigationController.navigationBar.isTranslucent = false
        
        rootViewController.title = title
        return navigationController
    }
}
