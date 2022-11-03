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
        
        view.backgroundColor = .systemBackground
        
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
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.barTintColor = UIColor(red: 0.043, green: 0.016, blue: 0.188, alpha: 1)
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.backButtonDisplayMode = .minimal
        rootViewController.title = title
        return navigationController
    }
}
