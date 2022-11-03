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
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .black
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .white
        setupVC()
    }
    
    private func setupVC() {
        let stripeAssembly = StripeAssembly()
        let homeVC = stripeAssembly.make(category: MovieCategory.home)
        let favoriteVC = stripeAssembly.make(category: MovieCategory.topRated)
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
        navigationController.navigationBar.tintColor = .white
        rootViewController.title = title
        return navigationController
    }
}
