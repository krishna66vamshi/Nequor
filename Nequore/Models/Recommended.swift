

import Foundation
import ObjectMapper

struct Recommended : Mappable {
	var id : Int?
	var for_sale : Int?
	var for_rent : Int?
	var locality_id : Int?
	var city_id : Int?
	var configuration_id : Int?
	var propertyTypeId : Int?
	var expected_price_sale : String?
	var expected_price_rent : String?
	var image : String?
	var image_thumb : String?
	var area : String?
	var floor : String?
	var possesion_date : String?
	var bedroom : Int?
	var bathroom : Int?
	var description : String?
	var quantity : Int?
	var created_by : Int?
	var status : Int?
	var step : Int?
	var building_id : Int?
	var currency_id : Int?
	var parking : Int?
	var furnished : Int?
	var pets : Int?
	var floor_plan : String?
	var min_price : Int?
	var max_price : Int?
	var is_blocked : String?
	var property_url : String?
	var created_at : String?
	var updated_at : String?
	var max_area : Int?
	var is_favorite : Int?
	var city : City?
	var locality : Locality?
	var configuration : Configuration?
	var propertyType : PropertyType?
	var currency : String?
	var creator : Creator?
	var images : [Images]?
	var customValues : [CustomValues]?
	var building : Building?
	var amenities : [Amenities]?
	var carpetAreas : [CarpetAreas]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		for_sale <- map["for_sale"]
		for_rent <- map["for_rent"]
		locality_id <- map["locality_id"]
		city_id <- map["city_id"]
		configuration_id <- map["configuration_id"]
		propertyTypeId <- map["property_type_id"]
		expected_price_sale <- map["expected_price_sale"]
		expected_price_rent <- map["expected_price_rent"]
		image <- map["image"]
		image_thumb <- map["image_thumb"]
		area <- map["area"]
		floor <- map["floor"]
		possesion_date <- map["possesion_date"]
		bedroom <- map["bedroom"]
		bathroom <- map["bathroom"]
		description <- map["description"]
		quantity <- map["quantity"]
		created_by <- map["created_by"]
		status <- map["status"]
		step <- map["step"]
		building_id <- map["building_id"]
		currency_id <- map["currency_id"]
		parking <- map["parking"]
		furnished <- map["furnished"]
		pets <- map["pets"]
		floor_plan <- map["floor_plan"]
		min_price <- map["min_price"]
		max_price <- map["max_price"]
		is_blocked <- map["is_blocked"]
		property_url <- map["property_url"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
		max_area <- map["max_area"]
		is_favorite <- map["is_favorite"]
		city <- map["city"]
		locality <- map["locality"]
		configuration <- map["configuration"]
		propertyType <- map["property_type"]
		currency <- map["currency"]
		creator <- map["creator"]
		images <- map["images"]
		customValues <- map["custom_values"]
		building <- map["building"]
		amenities <- map["amenities"]
		carpetAreas <- map["carpet_areas"]
	}

}
