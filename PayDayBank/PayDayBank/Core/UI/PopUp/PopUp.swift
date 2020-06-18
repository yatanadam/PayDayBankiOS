//
//  PopUp.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import PopupDialog

class PopUp {
    class func popupWithCancel(title: String? = "", message: String? = "", inController: BaseViewController) {
        let popup = PopupDialog(title: title, message: message)
        let buttonOne = CancelButton(title: "CANCEL") {
            popup.dismiss()
        }
        popup.addButtons([buttonOne])
        inController.present(popup, animated: true, completion: nil)
    }
    
    class func popupWithOK(title: String? = "", message: String? = "", inController: BaseViewController, completion: @escaping () -> ()) {
        let popup = PopupDialog(title: title, message: message)
        let buttonOne = DefaultButton(title: "OK") {
            completion()
            popup.dismiss()
        }
        popup.addButtons([buttonOne])
        inController.present(popup, animated: true, completion: nil)
    }
}
