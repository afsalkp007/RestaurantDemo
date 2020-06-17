//
//  Models.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 16/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation


struct Root: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl: URL
    let distance: Double
}

struct RestaurantListViewModel {
    let name: String
    let imageUrl: URL
    let distance: Double
    let id: String
    
    static var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }
    
    var formattedDistance: String? {
        return RestaurantListViewModel.numberFormatter.string(from: distance as NSNumber)
    }
}

extension RestaurantListViewModel {
    init(business: Business) {
        self.name = business.name
        self.imageUrl = business.imageUrl
        self.distance = business.distance / 1609.344
        self.id = business.id
    }
}
