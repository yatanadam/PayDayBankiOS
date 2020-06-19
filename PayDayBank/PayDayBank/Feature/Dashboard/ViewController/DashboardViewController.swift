//
//  DashboardViewController.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var transactionTableView: UITableView?
    @IBOutlet weak var salaryLabel: UILabel?
    @IBOutlet weak var gameLabel: UILabel?
    @IBOutlet weak var toysLabel: UILabel?
    @IBOutlet weak var othersLabel: UILabel?

    var presenter: DashboardPresenter?
    var transactionList = [TransactionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = DashboardPresenter(protocolDelegate: self)
        
        transactionTableView?.register(TransactionTableViewCell.self, forCellReuseIdentifier: String(describing: TransactionTableViewCell.self))
        transactionTableView?.register(UINib(nibName: String(describing: TransactionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionTableViewCell.self))

        
        guard let customerID =  SessionManager.shared.customer?.id else {
            return
       }
        presenter!.fetchAccounts(customerID: customerID)
    }
    
    
    func calculateAmountsByCategory() {
        
        let salaryTransactionList = transactionList.filter({ (transaction:TransactionModel) -> Bool in
            transaction.category ?? "" == "Salary"
            })
        
        let gameTransactionList = transactionList.filter({ (transaction:TransactionModel) -> Bool in
                 transaction.category ?? "" == "Game"
                 })
        
        let toysTransactionList = transactionList.filter({ (transaction:TransactionModel) -> Bool in
                     transaction.category ?? "" == "Toys"
                     })
        
        let otherTransactionList = transactionList.filter({ (transaction:TransactionModel) -> Bool in
            
            !["Game","Salary","Toys"].contains(transaction.category ?? "")
            
        })
        
        
        let salaryAmount = salaryTransactionList.reduce(0.0) { $0 + Double($1.amount!)! }
        let gameAmount = gameTransactionList.reduce(0.0) { $0 + Double($1.amount!)! }
        let toysAmount = toysTransactionList.reduce(0.0) { $0 + Double($1.amount!)! }
        let othersAmount = otherTransactionList.reduce(0.0) { $0 + Double($1.amount!)! }

        
        salaryLabel?.text = String(format: "%.2f", salaryAmount)
        gameLabel?.text = String(format: "%.2f", gameAmount)
        toysLabel?.text = String(format: "%.2f", toysAmount)
        othersLabel?.text = String(format: "%.2f", othersAmount)

        
    }
    
        
    @IBAction func showAllTransactionsPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "showTransactions", sender: nil)
    }
    
        

   
}

extension DashboardViewController: DahboardPresenterProtocol {
    
    func accountsFetched(accountList: [AccountModel]) {
        
        for accont in accountList.enumerated() {
            presenter?.fetchTransactions(accountID: accont.element.id )
        }
    }
    
    func transactionListFetched(transactionList: [TransactionModel]) {
         
        for transaction in transactionList.enumerated() {
            self.transactionList.append(transaction.element)
        }
        
        calculateAmountsByCategory()

        transactionTableView?.reloadData()
        
    }
}


extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TransactionTableViewCell =  tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionTableViewCell.self)) as! TransactionTableViewCell

        let transaction =  transactionList[indexPath.row]
        
        cell.amountLabel?.text = transaction.amount ?? ""
        cell.descriptionLabel?.text = transaction.category ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}
