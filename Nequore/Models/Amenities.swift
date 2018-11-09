

import Foundation
import ObjectMapper

struct Amenities : Mappable {
	var id : Int?
	var name_en : String?
	var name_es : String?
	var icon : String?
	var created_by : Int?
	var status : Int?
	var name : String?
	var pivot : Pivot?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name_en <- map["name_en"]
		name_es <- map["name_es"]
		icon <- map["icon"]
		created_by <- map["created_by"]
		status <- map["status"]
		name <- map["name"]
		pivot <- map["pivot"]
	}

}
