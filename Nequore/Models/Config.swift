

import Foundation
import ObjectMapper

struct Config : Mappable {
	var id : Int?
	var name_en : String?
	var name_es : String?
	var created_by : Int?
	var status : Int?
	var created_at : String?
	var updated_at : String?
	var name : String?
	var is_selected : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name_en <- map["name_en"]
		name_es <- map["name_es"]
		created_by <- map["created_by"]
		status <- map["status"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
		name <- map["name"]
		is_selected <- map["is_selected"]
	}

}
