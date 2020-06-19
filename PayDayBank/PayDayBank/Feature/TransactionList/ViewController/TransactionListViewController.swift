//
//  TransactionListViewController.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class TransactionListViewController: BaseViewController {
    var presenter: TransactionListPresenter?
    
    @IBOutlet weak var accountsPickerView: PrimaryPicker!
    @IBOutlet weak var transactionsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TransactionListPresenter(protocolDelegate: self)
        
        accountsPickerView.delegate = self
        accountsPickerView.dataSource = self
        
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        transactionsTableView.register(TransactionListTableViewCell.self, forCellReuseIdentifier: String(describing: TransactionListTableViewCell.self))
        transactionsTableView.register(UINib(nibName: String(describing: TransactionListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionListTableViewCell.self))
        
        presenter?.fetchAccounts()
    }
}

extension TransactionListViewController: TransactionListPresenterProtocol {
    func accountsFetched() {
        accountsPickerView.reloadAllComponents()
        presenter?.accountSelected(atIndex: 0)
    }
    
    func transactionsFetched() {
        transactionsTableView.reloadData()
    }
}

extension TransactionListViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.presenter?.accountSelected(atIndex: row)
    }
}

extension TransactionListViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter?.getAccountsCount() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 12)
        label.text =  presenter?.getAccountTitle(atIndex: row)
        label.textAlignment = .center
        return label
    }
    
}

extension TransactionListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTransactionsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TransactionListTableViewCell =  tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionListTableViewCell.self)) as! TransactionListTableViewCell

        let transaction =  self.presenter?.getTransaction(atIndex: indexPath.row)
        
        cell.amountLabel?.text = transaction?.amount ?? ""
        cell.descriptionLabel?.text = transaction?.vendor ?? ""
        cell.dateLabel?.text = transaction?.date ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
