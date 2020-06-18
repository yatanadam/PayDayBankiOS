//
//  AccountModel.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

struct AccountModel: Codable {
    let id: Int
    let iban: String?
    let active: Bool? = false
    let type: String?
    let date_created: String?
}
