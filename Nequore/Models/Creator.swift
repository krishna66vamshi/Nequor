

import Foundation
import ObjectMapper

struct Creator : Mappable {
	var id : Int?
	var name : String?
	var image : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		image <- map["image"]
	}

}
