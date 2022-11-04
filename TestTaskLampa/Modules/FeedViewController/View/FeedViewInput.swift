//
//  FeedViewInput.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import Foundation

protocol FeedViewInput: AnyObject {    
    func reloadTableView()
    func startIndicator()
    func stopIndicator()
    func showAlert(message: String)
}
