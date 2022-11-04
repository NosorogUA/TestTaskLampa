//
//  DetailRowType.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 03.11.2022.
//

import Foundation

enum DetailRowType: Int {
    static var allCases: [DetailRowType] {
        return [.poster, .description]
        }
   case poster
   case description
}
