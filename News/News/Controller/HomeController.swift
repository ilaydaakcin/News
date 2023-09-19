//
//  ViewController.swift
//  News
//
//  Created by Apple on 18.09.2023.
// 

import Foundation
import UIKit
import SDWebImage

class HomeController : UIViewController {
    
    //MARK: - Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let indicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        return indicator
    }()
    
    private var viewModel : NewsListViewModel!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Good News"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
        setup()
        indicator.startAnimating()
    }
    
    //MARK: - Actions
    
    @objc func refresh(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    //MARK: - Helpers
    
    private func setup() {
        configureTableView()
        getData()
        configureRefresh()
        indicatorUI()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
    }
    
    func configureRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    private func indicatorUI() {
        view.addSubview(indicator)
        indicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: - GetData
    
    func getData() {
        NewsManager().fetchNewsData { article in
            
            if let article = article {
                
                self.viewModel = NewsListViewModel(newsList: article)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.indicator.stopAnimating()
                }
            }
        }
    }
}

//MARK: - TableViewDelegate & DataSource

extension HomeController : CreateTableView {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell else { return UITableViewCell() }
        
        let viewModel = self.viewModel.newsAtIndex(indexPath.row)
        
        cell.titleLbel.text = viewModel.title
        cell.newsImage.sd_setImage(with: URL(string: viewModel.urlToImage))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewModel = self.viewModel.newsAtIndex(indexPath.row)
        
        if let url = URL(string: viewModel.url) {
            let webViewController = WebViewController()
            webViewController.url = url
            
            navigationController?.pushViewController(webViewController, animated: true)
            
        } else {
            print("Geçersiz URL")
        }
    }
}
