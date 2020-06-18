//
//  ActivityIndicator.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import MaterialActivityIndicator

class ActivityIndicator {
    static let shared = ActivityIndicator()
    
    var indicator: MaterialActivityIndicatorView
    
    init() {
        indicator = MaterialActivityIndicatorView()
        indicator.color = .cyan
    }
    
    func show() {
        topMostController()?.view.addSubview(indicator)
        setupActivityIndicatorViewConstraints(view: topMostController()?.view)
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
        indicator.removeFromSuperview()
    }
    
    private func setupActivityIndicatorViewConstraints(view: UIView?) {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        guard let view = view else {
            return
        }
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func topMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}
