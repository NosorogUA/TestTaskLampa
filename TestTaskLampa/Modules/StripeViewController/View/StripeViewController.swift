//
//  StripeViewController.swift
//  TestTaskLampa
//
//  Created by Ihor Tokalenko on 02.11.2022.
//

import UIKit

class StripeViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: StripeViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        setupNavigationBar()
        setupTableview()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func loadData() {
        presenter.loadData()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let logo = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        self.navigationItem.titleView?.contentMode = .scaleAspectFit
        
        print("Hi, I'm view and try to start my work")
    }
    
    private func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        let mainCell = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(mainCell, forCellReuseIdentifier: "MainTableViewCell")
    }

}
extension StripeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! StripeTableViewCell
        //print("Send cell: \(indexPath) to presenter")
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        presenter.configurateCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = self.presenter.getDetailVC(indexPath) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension StripeViewController: StripeViewInput {
    
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
extension StripeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            //fetch more data
            guard !presenter.isPaginating else { return }
            presenter.loadData()
            print("========> Load More")
        }
    }
}
