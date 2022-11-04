//
//  DetailViewController.swift
//  LampaTestTask01
//
//  Created by Ihor Tokalenko on 26.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
        
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: DetailOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        let logo = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
    }
    
    private func setupView() {
        view.backgroundColor = UISettings.Color.background
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let detailCell = UINib(nibName: DetailTableViewCell.identifier, bundle: nil)
        let detailInfoCell = UINib(nibName: DetailInfoTableViewCell.identifier, bundle: nil)
        tableView.register(detailCell, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.register(detailInfoCell, forCellReuseIdentifier: DetailInfoTableViewCell.identifier)
        
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: Strings.Headers.showMovie, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Strings.Headers.ok, style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table view data source
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.getSectionsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch DetailRowType(rawValue: indexPath.row) {
        case .poster:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            presenter.configureDetailCell(cell)
            cell.buttonHandler = { [weak self] in
                self?.showAlert(message: self?.presenter.getTitle() ?? "no title")
            }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoTableViewCell.identifier, for: indexPath) as! DetailInfoTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            presenter.configureDetailInfoCell(cell)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
}

extension DetailViewController: DetailInput {
    
}
