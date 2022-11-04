//
//  FeedViewController.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: FeedViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        setupNavigationBar()
        setupView()
        loadData()        
    }
    
    private func loadData() {
        presenter.loadData()
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
        let mainCell = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        tableView.register(mainCell, forCellReuseIdentifier: FeedTableViewCell.identifier)
    }

}
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as! FeedTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        presenter.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.presenter.getDetailVC(indexPath) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedViewController: FeedViewInput {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func startIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        activityIndicator.stopAnimating()
    }
    
    //MARK: Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: Strings.Headers.networkError, message: message, preferredStyle: .alert)
        let refresh = UIAlertAction(title: Strings.Headers.refresh, style: .default) { UIAlertAction in self.loadData() }
        let close = UIAlertAction(title: Strings.Headers.close, style: .default, handler: nil)
        alert.addAction(refresh)
        alert.addAction(close)
        self.present(alert, animated: true, completion: nil)
    }
}
//MARK: Pagination setup
extension FeedViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let offsetPagination: CGFloat = 100
        if position > (tableView.contentSize.height - offsetPagination - scrollView.frame.size.height) {
            //fetch more data
            guard !presenter.isPaginating else { return }
            presenter.loadData()
        }
    }
}
