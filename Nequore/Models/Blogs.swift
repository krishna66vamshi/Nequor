

import Foundation
import ObjectMapper

struct Blogs : Mappable {
	var id : Int?
	var title : String?
	var image : String?
	var description : String?
	var deleted_at : String?
	var updated_at : String?
	var created_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		title <- map["title"]
		image <- map["image"]
		description <- map["description"]
		deleted_at <- map["deleted_at"]
		updated_at <- map["updated_at"]
		created_at <- map["created_at"]
	}

}
