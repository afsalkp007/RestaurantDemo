/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Restaurants : Decodable {
    let businesses : [Businesses]?

    enum CodingKeys: String, CodingKey {
        case businesses = "businesses"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        businesses = try values.decodeIfPresent([Businesses].self, forKey: .businesses)
    }
    
    static func make(data: Data) -> Restaurants? {
      return try? JSONDecoder().decode(Restaurants.self, from: data)
    }
}


struct Businesses : Decodable {
	let id : String?
	let name : String?
	let imageUrl : String?
	let distance : Double?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case image_url = "image_url"
		case distance = "distance"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .image_url)
		distance = try values.decodeIfPresent(Double.self, forKey: .distance)
	}

}

struct RestaurantListViewModel {
    let name: String
    let imageUrl: String
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
        return RestaurantListViewModel.numberFormatter.string(from: NSNumber(value: distance))
    }
}

extension RestaurantListViewModel {
    init(business: Businesses) {
        self.name = business.name ?? ""
        self.imageUrl = business.imageUrl ?? ""
        self.distance = business.distance! / 1609.344
        self.id = business.id ?? ""
    }
}
