//
//  NetworkConstants.swift
//  NetflixCloneMVVM
//
//  Created by Fazli Altun on 17.04.2024.
//

import Foundation

protocol EndpointsProtocol {
    var baseURL: String {get}
    var genre: String {get}
    var APIKey: String {get}
    var method: HTTPMethod {get}
    
    func getAllURL() -> String
    func requestAPI() -> URLRequest
}

enum HTTPMethod: String {
    case POST
    case GET
}

enum Endpoints {
    case popular
    case topRated
    case upcoming
}

extension Endpoints: EndpointsProtocol {
    var baseURL: String {
    "https://api.themoviedb.org/3/movie/"
    }
    
    var genre: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
    
    var APIKey: String {
        "?api_key=5c2f9ddcdc3d881285d6773355520c3f"
    }
    
    var method: HTTPMethod {
        switch self {
        case .popular:
            return .GET
        case .topRated:
            return .GET
        case .upcoming:
            return .GET
        }
    }
    
    func getAllURL() -> String {
        return "\(baseURL)\(genre)\(APIKey)"
    }
    
    func requestAPI() -> URLRequest {
        guard let apiURL = URLComponents(string: getAllURL()) else {
            fatalError("URLComponents oluşturulamadı")
        }
        guard let url = apiURL.url else {
            fatalError("URL oluşturulamadı.")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
}
