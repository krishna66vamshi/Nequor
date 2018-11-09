
import Foundation
import ObjectMapper

struct Configurations : Mappable {
	var id : Int?
	var building_id : Int?
	var configuration_id : Int?
	var floor_map_image : String?
	var carpet_area : Int?
	var base_price : Int?
	var created_by : String?
	var created_at : String?
	var updated_at : String?
	var config : Config?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		building_id <- map["building_id"]
		configuration_id <- map["configuration_id"]
		floor_map_image <- map["floor_map_image"]
		carpet_area <- map["carpet_area"]
		base_price <- map["base_price"]
		created_by <- map["created_by"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
		config <- map["config"]
	}

}
