

import Foundation
import ObjectMapper

struct CarpetAreas : Mappable {
	var id : Int?
	var property_id : Int?
	var area : Int?
	var price : Int?
	var created_at : String?
	var updated_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		property_id <- map["property_id"]
		area <- map["area"]
		price <- map["price"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
	}

}
