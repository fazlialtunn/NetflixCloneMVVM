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
    let sections: [String] = ["Popular","Upcoming Movies", "Top Rated"]
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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .upcoming(let upcomingResult):
            upcomingMovies = upcomingResult
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .topRated(let topRatedResult):
            topRatedMovies = topRatedResult
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            print(error)
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as! CollectionViewTableViewCell
        switch indexPath.section {
        case SectionsTableView.popular.rawValue:
            cell.configure(movies: popularMovies)
        case SectionsTableView.topRated.rawValue:
            cell.configure(movies: topRatedMovies)
        case SectionsTableView.upcoming.rawValue:
            cell.configure(movies: upcomingMovies)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
