
import Foundation
import ObjectMapper

struct Developer : Mappable {
	var id : Int?
	var name : String?
	var email : String?
	var country_code : String?
	var dial_code : String?
	var phone : String?
	var image : String?
	var is_buyer : String?
	var is_seller : Int?
	var seller_type : String?
	var developer_title : String?
	var developer_url : String?
	var developer_image : String?
	var developer_desc : String?
	var is_blocked : Int?
	var is_email_verified : String?
	var is_phone_verified : String?
	var assigned_csr_buyer_id : String?
	var assigned_csr_seller_id : String?
	var year_estd : String?
	var seller_assigned_on : String?
	var created_at : String?
	var updated_at : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		email <- map["email"]
		country_code <- map["country_code"]
		dial_code <- map["dial_code"]
		phone <- map["phone"]
		image <- map["image"]
		is_buyer <- map["is_buyer"]
		is_seller <- map["is_seller"]
		seller_type <- map["seller_type"]
		developer_title <- map["developer_title"]
		developer_url <- map["developer_url"]
		developer_image <- map["developer_image"]
		developer_desc <- map["developer_desc"]
		is_blocked <- map["is_blocked"]
		is_email_verified <- map["is_email_verified"]
		is_phone_verified <- map["is_phone_verified"]
		assigned_csr_buyer_id <- map["assigned_csr_buyer_id"]
		assigned_csr_seller_id <- map["assigned_csr_seller_id"]
		year_estd <- map["year_estd"]
		seller_assigned_on <- map["seller_assigned_on"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
	}

}
