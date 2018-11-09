

import Foundation
import ObjectMapper

struct FeaturedLocalities : Mappable {
	var id : Int?
	var name_en : String?
	var name_es : String?
	var city_id : Int?
	var poly_coordinates : String?
	var status : Int?
	var price_per_sqft : Int?
	var is_featured : String?
	var buildings_count : Int?
	var name : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name_en <- map["name_en"]
		name_es <- map["name_es"]
		city_id <- map["city_id"]
		poly_coordinates <- map["poly_coordinates"]
		status <- map["status"]
		price_per_sqft <- map["price_per_sqft"]
		is_featured <- map["is_featured"]
		buildings_count <- map["buildings_count"]
		name <- map["name"]
	}

}
