//
//  HomeViewModelContracts.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 24.04.2024.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
}

protocol MovieListViewModelDelegate {
    func handleOutput(_ output: MovieListViewModelOutput)
}

enum MovieListViewModelOutput {
    case popular([MovieResult])
    case upcoming([MovieResult])
    case topRated([MovieResult])
    case error(String)
}

enum APIError: Error {
    case failedToGetData
    case failedToGetNewReleases
    case failedToGetFeaturedPlaylists
    case failedToGetRecommendations
    case failedToGetRecommendedGenres
}
