//
//  HomeServices.swift
//  Nequore
//
//  Created by Mahajan on 14/10/18.
//  Copyright © 2018 Mahajan. All rights reserved.
//

import Foundation
import PromiseKit

class HomeServices {
    private struct HomeRouter: Creatable {
        var route: String = "/user/home"
        var urlParams: String?
    }
}

extension HomeServices {
    static func homes() -> Promise<HomeData> {
        return Promise { seal in
            let request = HomeRouter.create(parameters: [:])
            print(request)
            
            ApiManager.shared.request(request: request, with: HomeData.self)
                .done({ (data, _) in
                    seal.fulfill(data)
                })
                .catch({ (error) in
                    seal.reject(error)
                })
        }
    }
}
