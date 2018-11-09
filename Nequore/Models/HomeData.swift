

import Foundation
import ObjectMapper

struct HomeData : Mappable {
	var recommended : [Recommended]?
	var topDevelopers : [TopDevelopers]?
	var preSale : [PreSale]?
	var popularProjects : [PopularProjects]?
	var featuredLocalities : [FeaturedLocalities]?
	var blogs : [Blogs]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		recommended <- map["recommended"]
		topDevelopers <- map["top_developers"]
		preSale <- map["pre_sale"]
		popularProjects <- map["popular_projects"]
		featuredLocalities <- map["featured_localities"]
		blogs <- map["blogs"]
	}

}
