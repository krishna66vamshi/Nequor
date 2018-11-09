

import Foundation
import ObjectMapper

struct Building : Mappable {
	var id : Int?
	var name : String?
	var address : String?
	var locality_id : Int?
	var city_id : Int?
	var lat : Double?
	var lng : Double?
	var main_image : String?
	var admin_id : Int?
	var user_developer : Int?
	var created_by : Int?
	var status : Int?
	var building_age : String?
	var buildingTypeId : Int?
	var description : String?
	var possession_status_id : Int?
	var floors : Int?
	var avg_price : Int?
	var launch_date : String?
	var is_blocked : String?
	var project_url : String?
	var starting_price : Int?
	var banks : [Banks]?
	var configurations : [Configurations]?
	var developer : Developer?
	var buildingType : BuildingType?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		address <- map["address"]
		locality_id <- map["locality_id"]
		city_id <- map["city_id"]
		lat <- map["lat"]
		lng <- map["lng"]
		main_image <- map["main_image"]
		admin_id <- map["admin_id"]
		user_developer <- map["user_developer"]
		created_by <- map["created_by"]
		status <- map["status"]
		building_age <- map["building_age"]
		buildingTypeId <- map["building_type_id"]
		description <- map["description"]
		possession_status_id <- map["possession_status_id"]
		floors <- map["floors"]
		avg_price <- map["avg_price"]
		launch_date <- map["launch_date"]
		is_blocked <- map["is_blocked"]
		project_url <- map["project_url"]
		starting_price <- map["starting_price"]
		banks <- map["banks"]
		configurations <- map["configurations"]
		developer <- map["developer"]
		buildingType <- map["building_type"]
	}

}
