//
//  DetailPresenter.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import Foundation

class DetailPresenter: DetailOutput {
    
    private unowned let view: DetailInput
    private let movie: Movie
       
    init(view: DetailInput, movieInfo: Movie) {
        self.view = view
        self.movie = movieInfo
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
            url = "https://image.tmdb.org/t/p/w500\(posterPath)"
        }
        cell.setup(title: movie.title, rating: movie.voteAverage, imageUrl: URL(string: url))
    }
    
    func configureDetailInfoCell(_ cell: DetailInfoTableViewCell) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-DD"
        let showDate = inputFormatter.date(from: movie.releaseDate)
        inputFormatter.dateFormat = "DD.MM.YYYY"
        let date = inputFormatter.string(from: showDate!)
        print(date)
        cell.setup(description: movie.overview, year: date)
    }
}
