//
//  UISettings.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 03.11.2022.
//

import UIKit

struct UISettings {
    struct Color {
        static let white = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        static let background = UIColor(red: 0.043, green: 0.016, blue: 0.188, alpha: 1)
        static let orange = UIColor(displayP3Red: 1, green: 0.612, blue: 0.029, alpha: 1)
        static let black = UIColor(displayP3Red: 0.153, green: 0.165, blue: 0.196, alpha: 1)
        static let darkGrey = UIColor(displayP3Red: 0.771, green: 0.771, blue: 0.771, alpha: 1)
    }
    
    struct Font {
        static let regularFontName = "Raleway-Regular"
        static let boldFontName = "Raleway-Bold"
        static let semiboldFontName = "Raleway-SemiBold"        
    }
    
}
