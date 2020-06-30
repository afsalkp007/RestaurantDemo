//
//  Models.swift
//  RestaurantApp
//
//  Created by Afsal's Macbook Pro on 16/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation
import CoreLocation

//struct Root: Codable {
//    let businesses: [Business]
//}
//
//struct Business: Codable {
//    let id: String
//    let name: String
//    let imageUrl: URL
//    let distance: Double
//}
//
//struct RestaurantListViewModel {
//    let name: String?
//    let imageUrl: String?
//    let distance: Double?
//    let id: String?
//    
//    static var numberFormatter: NumberFormatter {
//        let nf = NumberFormatter()
//        nf.numberStyle = .decimal
//        nf.maximumFractionDigits = 2
//        nf.minimumFractionDigits = 2
//        return nf
//    }
//    
//    var formattedDistance: String? {
//        return RestaurantListViewModel.numberFormatter.string(from: distance! as NSNumber)
//    }
//}
//
//extension RestaurantListViewModel {
//    init(business: Businesses) {
//        self.name = business.name
//        self.imageUrl = business.image_url
//        self.distance = business.distance! / 1609.344
//        self.id = business.id
//    }
//}
//
//struct Details: Decodable {
//    let price: String
//    let phone: String
//    let isClosed: Bool
//    let rating: Double
//    let name: String
//    let photos: [URL]
//    let coordinates: CLLocationCoordinate2D
//}
//
//extension CLLocationCoordinate2D: Decodable {
//    enum CodingKeys: CodingKey {
//        case latitude
//        case longitude
//    }
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let latitude = try container.decode(Double.self, forKey: .latitude)
//        let longitude = try container.decode(Double.self, forKey: .longitude)
//        self.init(latitude: latitude, longitude: longitude)
//    }
//}
//
//struct DetailsViewModel {
//    let name: String
//    let price: String
//    let isOpen: String
//    let phoneNumber: String
//    let rating: String
//    let imageUrls: [URL]
//    let coordinates: CLLocationCoordinate2D
//}
//
//extension DetailsViewModel {
//    init(details: Details) {
//        self.name = details.name
//        self.price = details.price
//        self.isOpen = details.isClosed ? "Closed" : "Open"
//        self.phoneNumber = details.phone
//        self.rating = "\(details.rating) / 5.0"
//        self.imageUrls = details.photos
//        self.coordinates = details.coordinates
//    }
//}
