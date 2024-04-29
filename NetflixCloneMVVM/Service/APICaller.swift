//
//  APICaller.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 24.04.2024.
//

import Foundation

protocol APIServiceProtocol {
    func createRequest<T: Decodable>(_ endPoint: Endpoints, completion: @escaping (Result<T,Error>) -> Void)
}

final class APICaller: APIServiceProtocol {
    
    enum APIError: Error {
        case failedToGetData
        case failedToGetNewReleases
        case failedToGetFeaturedPlaylists
        case failedToGetRecommendations
        case failedToGetRecommendedGenres
    }
    
    func createRequest<T: Decodable>(_ endPoint: Endpoints, completion: @escaping (Result<T,Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: endPoint.requestAPI()) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
