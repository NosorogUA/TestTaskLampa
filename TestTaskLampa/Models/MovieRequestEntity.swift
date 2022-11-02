//
//  MovieRequestEntity.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 24.10.2022.
//

import Foundation

struct MovieRequestEntity: Decodable {
    let page: Int
    let results: [Movie]
    let dates: Dates?
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
            case page
            case results
            case dates
            case totalResults = "total_results"
            case totalPages = "total_pages"
        }
}

struct Movie: Decodable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Float
    let voteCount: Int
    let video: Bool
    let voteAverage: Float
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        }
}

struct Dates: Decodable {
    let maximum: String
    let minimum: String
}
