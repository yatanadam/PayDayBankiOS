//
//  DashboardService.swift
//  PayDayBank
//
//  Created by Banksy on 17.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import Alamofire

class DashboardService: Service {
    
    init() {
        super.init(route: "accounts")
    }
    
    func accounts( customerID: Int, successBlock: @escaping ([AccountModel]?) -> (), errorBlock: @escaping (Error) -> ()?) {
        let accountsRequestModel = AccountsRequestModel(customer_id: customerID)
        caller.get( parameters: accountsRequestModel, successBlock: successBlock, errorBlock: errorBlock)
    }
}
