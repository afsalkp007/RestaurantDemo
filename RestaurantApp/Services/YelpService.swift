//
//  YelpService.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 14/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation
import CoreLocation
final class YelpService {
    
    private let baseUrl = URL(string: "https://api.yelp.com/v3/businesses")!
    private let apiKey = "m6Gc89E8oCLAkXrIPGgRwFHrISsXgMY5pJxE7OBZ25vKoiITccB7YbKx6SskSdW5VstGoB3J8_q3jvDYpl67B1c1eNo4yDZnQP4FDInjDibo0CtPU2tnUOeKxS7mXnYx"
    
    private let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    /// Fetch restaurant data
    /// - Parameter completion: Called when operation finishes
    func fetchRestaurants(_ coordinate: CLLocationCoordinate2D, completion: @escaping (Result<[Businesses]?>) -> Void) {
        let resource = Resource(url: baseUrl, path: "/search", parameters:
            ["latitude": "42.361145",
             "longitude": "-71.057083"
            ], headers: [
                "Authorization": "Bearer \(apiKey)"
        ])
        
        _ = networking.fetch(resource: resource, completion: { data in
            DispatchQueue.main.async {
                completion(.success(data.flatMap({ Restaurants.make(data: $0)?.businesses }) ?? []))
            }
        })
    }
    
    /// Fetch restuarant details
    /// - Parameter completion: Called when operation finishes
    func fetchRestaurantDetails(_ id: String, completion: @escaping (Result<Details?>) -> Void) {
        let resource = Resource(url: baseUrl, path: "/\(id)", headers: [
            "Authorization": "Bearer \(apiKey)"
        ])
        
        _ = networking.fetch(resource: resource, completion: { data in
            DispatchQueue.main.async {
                completion(.success(data.flatMap{ Details.make(data: $0) }))
            }
        })
    }
}



