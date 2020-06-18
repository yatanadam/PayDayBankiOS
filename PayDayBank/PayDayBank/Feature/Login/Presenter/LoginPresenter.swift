//
//  LoginPresenter.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol: BasePresenterProtocol {
    func loginAccepted()
}

class LoginPresenter: BasePresenter {
    weak var protocolDelegate: LoginPresenterProtocol?
    var view:BaseViewController!
    
    init(protocolDelegate: LoginPresenterProtocol) {
        self.protocolDelegate = protocolDelegate
    }
    
    func loginAction(email:String?, password:String?) {
        guard let email = email, let password = password else {
            protocolDelegate?.showAlert?(title: "Error", message: "Email or Password cant be empty")
            return
        }
        
        if !validateEmail(email: email) {
            protocolDelegate?.showAlert?(title: "Error", message: "Email is not correct")
        }
        if !validatePassword(password: password) {
            protocolDelegate?.showAlert?(title: "Error", message: "Password is not valid")
        }
        
        protocolDelegate?.preServiceCall?()
        LoginService().authenticate(email: email, password: password, successBlock: { (model) in
            let customerModel = model
            self.protocolDelegate?.postServiceCall?()
            SessionManager.shared.customer = customerModel
            self.protocolDelegate?.loginAccepted()

        }) { (error) -> ()? in
            self.protocolDelegate?.postServiceCall?()
            return self.protocolDelegate?.showAlert?(title: "Error", message: error.localizedDescription)
            }
        
    }
    
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: email)
    }
    
    func validatePassword(password: String) -> (Bool) {
        var isValid = true
        
        if password.count < Constants.Login.minPasswordCharacterCount {
            isValid = false
        }
        
        return (isValid)
    }

}
