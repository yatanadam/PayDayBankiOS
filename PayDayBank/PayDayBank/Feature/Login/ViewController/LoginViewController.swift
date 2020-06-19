//
//  LoginViewController.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    var presenter: LoginPresenter?
    
    @IBOutlet weak var emailTextField: PrimaryTextField?
    @IBOutlet weak var passwordTextField: PrimaryTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField?.delegate = self
        passwordTextField?.delegate = self
        presenter = LoginPresenter(protocolDelegate: self)
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        presenter?.loginAction(email: emailTextField?.text, password: passwordTextField?.text)
    }
}

extension LoginViewController: LoginPresenterProtocol {
   
    func loginAccepted() {
        self.performSegue(withIdentifier: "showDashboard", sender: nil)
    }
}

