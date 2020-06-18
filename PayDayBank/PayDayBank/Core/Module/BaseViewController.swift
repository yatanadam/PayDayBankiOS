//
//  BaseViewController.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController: BasePresenterProtocol {
    func preServiceCall() {
        ActivityIndicator.shared.show()
    }
    
    func postServiceCall() {
        ActivityIndicator.shared.hide()
    }
    
    func showAlert(title: String, message: String) {
        PopUp.popupWithCancel(title: title, message: message, inController : self)
    }
    
    func showPopUp(title: String, message: String, completion: @escaping () -> ()) {
        PopUp.popupWithOK(title: title, message: message, inController : self, completion: completion)
    }
}

extension BaseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
}
