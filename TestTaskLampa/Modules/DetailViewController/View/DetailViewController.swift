//
//  DetailViewController.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailOutput!
    @IBOutlet weak var tableView: UITableView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setupNavigationBar()
        setupTableview()
    }
    
    private func setupNavigationBar() {
        let logo = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
        //print("Hi, I'm view and try to start my work")
    }
        
    private func setupTableview() {
        view.backgroundColor = UIColor(red: 0.043, green: 0.016, blue: 0.188, alpha: 1)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let mainCell = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(mainCell, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getSectionsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        presenter.configureCell(cell)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}
extension DetailViewController: DetailInput {
    
}
