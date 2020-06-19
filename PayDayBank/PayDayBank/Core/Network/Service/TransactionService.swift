//
//  TransactionService.swift
//  PayDayBank
//
//  Created by Banksy on 18.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import Alamofire

class TransactionService: Service {
    
    init() {
        super.init(route: "transactions")
    }
    
    func getTransactionList( accountID: Int, successBlock: @escaping ([TransactionModel]?) -> (), errorBlock: @escaping (Error) -> ()?) {
        let transactionListRequestModel = TransactionListRequestModel(account_id: accountID)
        caller.get( parameters: transactionListRequestModel, successBlock: successBlock, errorBlock: errorBlock)
    }
}
