//
//  StripeAssembly.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

struct StripeAssembly {
    
    func make(category: MovieCategory) -> FeedViewController {
        let viewController = FeedViewController()
        let dataManager = NetworkManager()
        let presenter = StripePresenter(view: viewController, dataManager: dataManager, category: category)
        viewController.presenter = presenter
        return viewController
    }
}
