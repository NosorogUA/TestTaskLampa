//
//  MovieCategory.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 24.10.2022.
//

import Foundation

enum MovieCategory {
    case home
    case nowPlaying
    case topRated
    
    var urlPath: String {
        switch self {
        case .home:
            return "popular"
        case .nowPlaying:
            return "now_playing" //Misprint for test. change to -> now_playing > for correct result
        case .topRated:
            return "top_rated"
        }
    }
}
