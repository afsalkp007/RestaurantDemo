/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import CoreLocation

struct Details : Decodable {
	let name : String?
	let isClosed : Bool?
	let phone : String?
	let rating : Double?
	let coordinates : CLLocationCoordinate2D?
	let photos : [URL]?
	let price : String?
	

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case is_closed = "is_closed"
		case phone = "phone"
		case rating = "rating"
		case coordinates = "coordinates"
		case photos = "photos"
		case price = "price"
		
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		isClosed = try values.decodeIfPresent(Bool.self, forKey: .is_closed)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        coordinates = try values.decodeIfPresent(CLLocationCoordinate2D.self, forKey: .coordinates)
		photos = try values.decodeIfPresent([URL].self, forKey: .photos)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		
	}

    static func make(data: Data) -> Details? {
      return try? JSONDecoder().decode(Details.self, from: data)
    }
}

extension CLLocationCoordinate2D: Decodable {
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}

struct DetailsViewModel: Decodable {
    let name: String
    let price: String
    let isOpen: String
    let phoneNumber: String
    let rating: String
    let imageUrls: [URL]
    let coordinates: CLLocationCoordinate2D?
    
   
}

extension DetailsViewModel {
    init(details: Details) {
        self.name = details.name ?? ""
        self.price = details.price ?? ""
        self.isOpen = details.isClosed ?? false ? "Closed" : "Open"
        self.phoneNumber = details.phone ?? ""
        self.rating = "\(details.rating ?? 0.0) / 5.0"
        self.imageUrls = details.photos ?? []
        self.coordinates = details.coordinates
    }
}
