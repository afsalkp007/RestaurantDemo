//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 14/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "m6Gc89E8oCLAkXrIPGgRwFHrISsXgMY5pJxE7OBZ25vKoiITccB7YbKx6SskSdW5VstGoB3J8_q3jvDYpl67B1c1eNo4yDZnQP4FDInjDibo0CtPU2tnUOeKxS7mXnYx"

enum YelpService {
    
    enum BusinessProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(Id: String)
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(Id: Id):
                return "/\(Id)"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
    
}

