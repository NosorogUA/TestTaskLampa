//
//  DetailPresenter.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import Foundation

class DetailPresenter: DetailOutput {
    
    var view: DetailInput
    private let movie: Movie
       
    init(view: DetailInput, movieInfo: Movie) {
        self.view = view
        self.movie = movieInfo
    }
    
    func getSectionsCount() -> Int {
        return 1
    }
    
    func getRowsCount(_ section: Int) -> Int {
        return 2
    }
    
    func configureDetailCell(_ cell: DetailTableViewCell) {
        guard let posterPath = movie.posterPath else { return }
        let url = "https://image.tmdb.org/t/p/w500\(posterPath)"
        cell.setup(title: movie.title, rating: movie.voteAverage, imageUrl: URL(string: url))
    }
    
    func configureDetailInfoCell(_ cell: DetailInfoTableViewCell) {
        cell.setup(description: movie.overview, year: movie.releaseDate)
    }
}
