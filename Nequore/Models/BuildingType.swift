

import Foundation
import ObjectMapper

struct BuildingType : Mappable {
	var id : Int?
	var name_en : String?
	var name_es : String?
	var status : Int?
	var created_by : Int?
	var created_at : String?
	var updated_at : String?
	var name : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name_en <- map["name_en"]
		name_es <- map["name_es"]
		status <- map["status"]
		created_by <- map["created_by"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
		name <- map["name"]
	}

}
