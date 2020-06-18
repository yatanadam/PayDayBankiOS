//
//  LoginService.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

class LoginService: Service {
    
    init() {
        super.init(route: "authenticate")
    }
    
    func authenticate(email: String, password: String,  successBlock: @escaping (CustomerModel?) -> (), errorBlock: @escaping (Error) -> ()?) {
        let loginRequestModel = LoginRequestModel(email: email, password: password)
        caller.post(parameters: loginRequestModel, successBlock: successBlock, errorBlock: errorBlock)
    }
}
