
import Foundation
import ObjectMapper

struct CustomValues : Mappable {
	var id : Int?
	var property_id : Int?
	var name : String?
	var value : String?
	var created_at : String?
	var updated_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		property_id <- map["property_id"]
		name <- map["name"]
		value <- map["value"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
	}

}
