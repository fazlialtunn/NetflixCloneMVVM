//
//  HomeViewController.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 27.03.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    lazy var tableView = UITableView()
    var popularMovies = [MovieResult]()
    var upcomingMovies = [MovieResult]()
    var topRatedMovies = [MovieResult]()
    var viewModel: HomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        viewModel?.delegate = self
        viewModel?.load()
    }
 
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        view.addSubview(tableView)
        let headerView = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight*0.35))
        tableView.tableHeaderView = headerView
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: MovieListViewModelDelegate {
    func handleOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .popular(let popularResult):
            popularMovies = popularResult
            print(popularResult)
        case .upcoming(let upcomingResult):
            upcomingMovies = upcomingResult
        case .topRated(let topRatedResult):
            topRatedMovies = topRatedResult
        case .error(let error):
            print(error)
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
