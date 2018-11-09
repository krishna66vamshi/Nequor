

import Foundation
import ObjectMapper

struct City : Mappable {
	var id : Int?
	var state_id : Int?
	var name_en : String?
	var name_es : String?
	var status : Int?
	var name : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		state_id <- map["state_id"]
		name_en <- map["name_en"]
		name_es <- map["name_es"]
		status <- map["status"]
		name <- map["name"]
	}

}
