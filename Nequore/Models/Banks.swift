

import Foundation
import ObjectMapper

struct Banks : Mappable {
	var id : Int?
	var name : String?
	var email : String?
	var address : String?
	var image : String?
	var country_code : String?
	var dial_code : String?
	var phone : String?
	var is_blocked : Int?
	var created_by : Int?
	var is_bank : Int?
	var is_noatary : String?
	var floating_int : String?
	var branch : String?
	var is_acl : Int?
	var created_at : String?
	var updated_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		email <- map["email"]
		address <- map["address"]
		image <- map["image"]
		country_code <- map["country_code"]
		dial_code <- map["dial_code"]
		phone <- map["phone"]
		is_blocked <- map["is_blocked"]
		created_by <- map["created_by"]
		is_bank <- map["is_bank"]
		is_noatary <- map["is_noatary"]
		floating_int <- map["floating_int"]
		branch <- map["branch"]
		is_acl <- map["is_acl"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
	}

}
