//
//  MovieCategory.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 24.10.2022.
//

import Foundation

enum MovieCategory {
    case home    
    case topRated
    
    var urlPath: String {
        switch self {
        case .home:
            return "popular"        
        case .topRated:
            return "top_rated"
        }
    }
}
