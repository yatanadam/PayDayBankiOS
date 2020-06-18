//
//  Service.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

class Service {
    let BASE_URL = "http://localhost:3000/"
    
    var caller: ServiceAPICaller
    var route: String
    
    init(route: String) {
        self.route = route
        caller = ServiceAPICaller(baseUrl: BASE_URL, route: route)
    }    
}
