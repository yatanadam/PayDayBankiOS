//
//  SignUpService.swift
//  PayDayBank
//
//  Created by  on 17.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

class SignUpService: Service {
    
    init() {
        super.init(route: "customers")
    }
    
    func signUp(first_name: String, last_name: String, gender: String, email: String, password: String, dob: String, phone: String,  successBlock: @escaping (CustomerModel?) -> (), errorBlock: @escaping (Error) -> ()?) {
        let signUpRequestModel = SignUpRequestModel(first_name: first_name, last_name: last_name, gender: gender, email: email, password: password, dob: dob, phone: phone)
        caller.post(parameters: signUpRequestModel, successBlock: successBlock, errorBlock: errorBlock)
    }
}
