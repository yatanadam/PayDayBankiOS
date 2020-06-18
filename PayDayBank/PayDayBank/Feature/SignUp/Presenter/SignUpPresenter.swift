//
//  SignUpPresenter.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

protocol SignUpPresenterProtocol: BasePresenterProtocol {
    func signUpAccepted()
}

class SignUpPresenter: BasePresenter {
    weak var protocolDelegate: SignUpPresenterProtocol?
    var view:BaseViewController!
    
    init(protocolDelegate: SignUpPresenterProtocol) {
        self.protocolDelegate = protocolDelegate
    }
    
    func signUpAction(first_name: String?, last_name: String?, gender: String?, email:String?, password:String?, dob: String?, phone: String?) {
        guard let first_name = first_name, let last_name = last_name, let gender = gender, let email = email, let password = password, let dob = dob, let phone = phone else {
            protocolDelegate?.showAlert?(title: "Error", message: "Fields cant be empty")
            return
        }
        
        if !validateEmail(email: email) {
            protocolDelegate?.showAlert?(title: "Error", message: "Email is not correct")
        }
        if !validatePassword(password: password) {
            protocolDelegate?.showAlert?(title: "Error", message: "Password is not valid")
        }
        
        protocolDelegate?.preServiceCall?()
        SignUpService().signUp(first_name: first_name, last_name: last_name, gender: gender, email: email, password: password, dob: dob, phone: phone, successBlock: { (model) in
            let customerModel = model
            self.protocolDelegate?.postServiceCall?()
            SessionManager.shared.customer = customerModel
            self.protocolDelegate?.signUpAccepted()

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
