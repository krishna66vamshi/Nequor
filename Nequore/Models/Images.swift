

import Foundation
import ObjectMapper

struct Images : Mappable {
	var id : Int?
	var property_id : Int?
	var image : String?
	var image_thumb : String?
	var created_at : String?
	var updated_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		property_id <- map["property_id"]
		image <- map["image"]
		image_thumb <- map["image_thumb"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
	}

}
