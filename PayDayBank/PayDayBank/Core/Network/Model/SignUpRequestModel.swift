//
//  SignUpRequestModel.swift
//  PayDayBank
//
//  Created by  on 17.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

struct SignUpRequestModel: Codable {
    let first_name: String
    let last_name: String
    let gender: String
    let email: String
    let password: String
    let dob: String
    let phone: String
}
