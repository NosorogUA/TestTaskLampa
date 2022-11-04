//
//  UISettings.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 03.11.2022.
//

import UIKit

struct UISettings {
    struct Color {
        static let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let background = UIColor(red: 0.043, green: 0.016, blue: 0.188, alpha: 1)
        static let orange = UIColor(red: 1, green: 0.612, blue: 0.029, alpha: 1)
        static let black = UIColor(red: 0.027, green: 0.012, blue: 0.114, alpha: 1)
        static let darkGrey = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 1)
    }
    
    struct Font {
        static let regularFontName = "Raleway-Regular"
        static let boldFontName = "Raleway-Bold"
        static let semiboldFontName = "Raleway-SemiBold"        
    }
    
    struct Constants {
        static let cornerRadius: CGFloat = 8
    }
    
}
