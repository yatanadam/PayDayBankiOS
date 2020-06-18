//
//  CustomerModel.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

struct CustomerModel: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let gender: String
    let email: String
    let password: String
    let dob: String
    let phone: String
}
