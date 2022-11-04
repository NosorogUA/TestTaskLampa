//
//  DetailPresenter.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import Foundation

class DetailPresenter: DetailOutput {
    
    private unowned let view: DetailInput
    private let dataManager: NetworkManager
    private let movie: Movie
       
    init(view: DetailInput, movieInfo: Movie, dataManager: NetworkManager) {
        self.view = view
        self.movie = movieInfo
        self.dataManager = dataManager
    }
    
    func getSectionsCount() -> Int {
        return 1
    }
    
    func getRowsCount(_ section: Int) -> Int {
        return DetailRowType.allCases.count
    }
    
    func getTitle()-> String {
        return movie.title
    }
    
    func configureDetailCell(_ cell: DetailTableViewCell) {
        var url = ""
        if let posterPath = movie.posterPath {
            url = dataManager.getImageURL(posterPath)
        }
        cell.setup(title: movie.title, rating: movie.voteAverage, imageUrl: URL(string: url))
    }
    
    func configureDetailInfoCell(_ cell: DetailInfoTableViewCell) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-DD"
        let showDate = inputFormatter.date(from: movie.releaseDate)
        inputFormatter.dateFormat = "DD.MM.YYYY"
        var date = ""
        if let currentDate = showDate {
            date = inputFormatter.string(from: currentDate)
        }        
        cell.setup(description: movie.overview, year: date)
    }
}
