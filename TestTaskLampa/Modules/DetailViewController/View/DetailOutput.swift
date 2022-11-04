//
//  DetailOutput.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import Foundation

protocol DetailOutput {
    func getSectionsCount() -> Int
    func getRowsCount(_ section: Int) -> Int
    func getTitle()-> String
    func configureDetailCell(_ cell: DetailTableViewCell)
    func configureDetailInfoCell(_ cell: DetailInfoTableViewCell)    
}
