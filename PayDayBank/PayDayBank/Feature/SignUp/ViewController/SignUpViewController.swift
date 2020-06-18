//
//  SignUpViewController.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController {
    var presenter: SignUpPresenter?
    
    @IBOutlet weak var firstNameTextField: PrimaryTextField?
    @IBOutlet weak var lastNameTextField: PrimaryTextField?
    @IBOutlet weak var phoneNumberTextField: PrimaryTextField?
    @IBOutlet weak var emailTextField: PrimaryTextField?
    @IBOutlet weak var passwordTextField: PrimaryTextField?
    @IBOutlet weak var genderTextField: PrimaryTextField?
    @IBOutlet weak var dateOfBirthTextField: PrimaryTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField?.delegate = self
        lastNameTextField?.delegate = self
        phoneNumberTextField?.delegate = self
        emailTextField?.delegate = self
        passwordTextField?.delegate = self
        genderTextField?.delegate = self
        dateOfBirthTextField?.delegate = self
        presenter = SignUpPresenter(protocolDelegate: self)
    }
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        presenter?.signUpAction(first_name: firstNameTextField?.text, last_name: lastNameTextField?.text, gender: genderTextField?.text, email: emailTextField?.text, password: passwordTextField?.text, dob: dateOfBirthTextField?.text, phone: phoneNumberTextField?.text)
    }
}

extension SignUpViewController: SignUpPresenterProtocol {
    func signUpAccepted() {
        self.showPopUp(title: "Success", message: "You can login now") {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
