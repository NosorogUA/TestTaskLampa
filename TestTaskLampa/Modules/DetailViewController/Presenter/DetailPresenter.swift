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
        return 1
    }
    
    func configureCell(_ cell: DetailTableViewCell) {
        print("Try to setup cell in presenter")
        guard let posterPath = movie.posterPath else { return }
        let url = "https://image.tmdb.org/t/p/w500\(posterPath)"
        cell.setup(title: movie.title, description: movie.overview, year: movie.releaseDate, rating: movie.popularity, imageUrl: URL(string: url))
    }
}
