//
//  HomeViewModelBuilder.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 29.04.2024.
//

import Foundation

class HomeViewModelBuilder {
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewModel = HomeViewModel(apiService: APICaller())
        vc.viewModel = viewModel
        return vc
    }
}
