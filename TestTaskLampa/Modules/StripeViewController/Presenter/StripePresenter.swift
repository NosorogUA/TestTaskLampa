//
//  StripePresenter.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

class StripePresenter: StripeViewOutput {
    
    var isPaginating = false
    
    private var data: [Movie] = []
    private var view: StripeViewInput
    private var dataManager: NetworkManager
    private var category: MovieCategory
    private var page: Int
    
    init(view: StripeViewInput, dataManager: NetworkManager, category: MovieCategory) {
        self.view = view
        self.dataManager = dataManager
        self.category = category
        page = 1
    }
    
    func getTitle() -> String {
        let title: String
        switch category {
        case .home:
            title = Strings.Headers.popular
        case .nowPlaying:
            title = Strings.Headers.nowPlaying
        case .topRated:
            title = Strings.Headers.favorite
        }
        return title
    }
    
    func getSectionsCount() -> Int {
        return 1
    }
    
    func getRowsCount(_ section: Int) -> Int {
        return data.count
    }
    
    func configurateCell(_ cell: StripeTableViewCell, indexPath: IndexPath) {
        
        let movie = data[indexPath.row]
        var url = ""
        if let posterPath = movie.posterPath {
            url = dataManager.getImageURL(posterPath)
        }
        let data = "\(Strings.Headers.release): \(movie.releaseDate)"
        
        cell.setup(title: movie.title, description: movie.overview, date: data, imageUrl: URL(string: url))
    }
    
    func getDetailVC(_ indexPath: IndexPath) -> DetailViewController? {
        
        let movie = data[indexPath.row]
        let detailAssembly = DetailAssembly()
        let vc = detailAssembly.make(movieInfo: movie)
        return vc
    }
    
    func loadData() {
        view.startIndicator()
        print("Write data to presenter")
        isPaginating = true
        dataManager.loadDataFromAPI(category: category.urlPath, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieRequest):
                //print("Movies info: \(movieRequest.results)")
                self.data.append(contentsOf: movieRequest.results)
                DispatchQueue.main.async {
                    self.view.reloadTableView()
                    self.view.stopIndicator()
                    self.page += 1
                    self.isPaginating = false
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.view.showAlert(message: error.localizedDescription)
                    self.isPaginating = false
                    self.view.stopIndicator()
                }
            }
        }
    }
}
