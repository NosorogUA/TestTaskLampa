//
//  FeedViewOutput.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

protocol FeedViewOutput {
    var isPaginating: Bool { get }
    func loadData()
    func getTitle() -> String
    func configureCell(_ cell: FeedTableViewCell, indexPath: IndexPath)
    func getRowsCount(_ section: Int) -> Int
    func getSectionsCount() -> Int
    func getDetailVC(_ indexPath: IndexPath) -> DetailViewController?
}
