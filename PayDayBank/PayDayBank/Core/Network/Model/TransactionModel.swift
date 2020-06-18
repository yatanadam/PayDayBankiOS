//
//  TransactionModel.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

struct TransactionModel: Codable {
    let id: Int
    let account_id: Int
    let amount: String?
    let vendor: String?
    let category: String?
    let date: String?
}
