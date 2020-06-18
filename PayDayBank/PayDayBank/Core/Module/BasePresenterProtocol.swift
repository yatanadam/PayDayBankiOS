//
//  BasePresenterProtocol.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

@objc protocol BasePresenterProtocol: class {
    @objc optional func preServiceCall()
    @objc optional func postServiceCall()
    @objc optional func showAlert(title: String, message: String)
    @objc optional func showPopUp(title: String, message: String, completion: @escaping () -> ())
}
