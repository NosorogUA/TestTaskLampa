//
//  StripeViewOutput.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

protocol StripeViewOutput {
    var isPaginating: Bool { get }
    func loadData()
    func getTitle() -> String
    func configurateCell(_ cell: StripeTableViewCell, indexPath: IndexPath)
    func getRowsCount(_ section: Int) -> Int
    func getSectionsCount() -> Int
    func getDetailVC(_ indexPath: IndexPath) -> DetailViewController?
}
