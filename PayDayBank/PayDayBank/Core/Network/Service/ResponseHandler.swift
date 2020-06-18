//
//  ResponseHandler.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation

class ResponseHandler<T: Codable> {
    func handleResponse(jsonData: Data?, model: T.Type) -> T? {
        guard let jsonData = jsonData else {return nil}
        let model = try! JSONDecoder().decode(model, from: jsonData)
        return model
    }
}
