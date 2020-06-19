//
//  TransactionListPresenter.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

protocol TransactionListPresenterProtocol: BasePresenterProtocol {
    func accountsFetched()
    func transactionsFetched()
}

class TransactionListPresenter: BasePresenter {
    weak var protocolDelegate: TransactionListPresenterProtocol?
    var view:BaseViewController!
    var accounts: [AccountModel]?
    var transactions: [TransactionModel]?
    
    init(protocolDelegate: TransactionListPresenterProtocol) {
        self.protocolDelegate = protocolDelegate
    }
    
    func fetchAccounts() {
        protocolDelegate?.preServiceCall?()
        DashboardService().accounts(customerID: SessionManager.shared.customer?.id ?? 0, successBlock: { (accounts) in
            self.protocolDelegate?.postServiceCall?()
            self.accounts = accounts
            self.protocolDelegate?.accountsFetched()
        }) { (error) -> ()? in
            self.protocolDelegate?.postServiceCall?()
            return self.protocolDelegate?.showAlert?(title: "Error", message: error.localizedDescription)
        }
    }
    
    func accountSelected(atIndex: Int) {
        guard let account = accounts?[atIndex] else { return }
        protocolDelegate?.preServiceCall?()
        TransactionService().getTransactionList(accountID: account.id, successBlock: { (transactions) in
            self.protocolDelegate?.postServiceCall?()
            self.transactions = transactions
            self.protocolDelegate?.transactionsFetched()
        }) { (error) -> ()? in
            self.protocolDelegate?.postServiceCall?()
            return self.protocolDelegate?.showAlert?(title: "Error", message: error.localizedDescription)
        }
    }
    
    func getAccountTitle(atIndex: Int) -> String? {
        return accounts?[atIndex].iban
    }
    
    func getAccountsCount() -> Int {
        return accounts?.count ?? 0
    }
    
    func getTransaction(atIndex: Int) -> TransactionModel? {
        return transactions?[atIndex]
    }
    
    func getTransactionsCount() -> Int {
        return transactions?.count ?? 0
    }

}
