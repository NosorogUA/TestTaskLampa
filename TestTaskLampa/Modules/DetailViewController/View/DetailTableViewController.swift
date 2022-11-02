//
//  DetailTableViewController.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var presenter: DetailOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setupTableview()
    }
        
    private func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        let mainCell = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(mainCell, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getSectionsCount()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        presenter.configureCell(cell)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}

extension DetailTableViewController: DetailInput {
    
    
}
