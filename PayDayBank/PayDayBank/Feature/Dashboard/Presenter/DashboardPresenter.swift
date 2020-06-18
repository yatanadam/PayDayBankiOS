//
//  DashboardPresenter.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation


protocol DahboardPresenterProtocol: BasePresenterProtocol {
    func accountsFetched(accountList: [AccountModel])
    func transactionListFetched(transactionList: [TransactionModel])
    
}

class DashboardPresenter: BasePresenter {
    
    weak var protocolDelegate: DahboardPresenterProtocol?
    var view:BaseViewController!
    
    init(protocolDelegate: DahboardPresenterProtocol) {
        self.protocolDelegate = protocolDelegate
    }
    
    
    func fetchAccounts(customerID: Int) {
    
    protocolDelegate?.preServiceCall?()
        DashboardService().accounts(customerID:customerID, successBlock: { (accountList) in
            let accountModel = accountList
            self.protocolDelegate?.postServiceCall?()
            self.protocolDelegate?.accountsFetched(accountList: accountList!)

        }) { (error) -> ()? in
            self.protocolDelegate?.postServiceCall?()
            return self.protocolDelegate?.showAlert?(title: "Error", message: error.localizedDescription)
            }

        }
    
    
    func fetchTransactions(accountID: Int) {
    
        TransactionService().getTransactionList(accountID: accountID, successBlock: { (transactionList:[TransactionModel]?) in
            self.protocolDelegate?.postServiceCall?()
            self.protocolDelegate?.transactionListFetched(transactionList: transactionList!
            )
            
        }) { (error:Error) -> ()? in
            self.protocolDelegate?.postServiceCall?()
                      return self.protocolDelegate?.showAlert?(title: "Error", message: error.localizedDescription)
                      }
        
    }
    
    
}
