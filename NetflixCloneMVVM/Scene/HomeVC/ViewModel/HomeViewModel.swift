//
//  HomeViewModel.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 29.04.2024.
//

import Foundation

final class HomeViewModel: MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate?
    var apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func load() {
        apiService.createRequest(.popular) { [weak self] (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                self?.delegate?.handleOutput(.popular(movie.results))
            case .failure(let error):
                self?.delegate?.handleOutput(.error(error.localizedDescription))
            }
        }
    }
    
     
}
