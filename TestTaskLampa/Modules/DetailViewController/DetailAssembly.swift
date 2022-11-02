//
//  DetailAssembly.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import Foundation

struct DetailAssembly {
    
    func make(movieInfo: Movie) -> DetailTableViewController {
        let viewController = DetailTableViewController()
        let presenter = DetailPresenter(view: viewController, movieInfo: movieInfo)
        viewController.presenter = presenter
        return viewController
    }
}
