
import Foundation
import ObjectMapper

struct Pivot : Mappable {
	var building_id : Int?
	var amenity_id : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		building_id <- map["building_id"]
		amenity_id <- map["amenity_id"]
	}

}
