//
//  ServiceAPICaller.swift
//  PayDayBank
//
//  Created by  on 16.06.2020.
//  Copyright © 2020 . All rights reserved.
//

import Foundation
import Alamofire

class ServiceAPICaller {
    
    let baseUrl: String
    let route: String
    
    init(baseUrl: String, route: String) {
        self.baseUrl = baseUrl
        self.route = route
    }
    
    func post<T:Codable, Z: Codable>(parameters: T, successBlock: @escaping (Z?) -> (), errorBlock: @escaping (Error) -> ()?) {
        AF.request(baseUrl+route,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                    case .success:
                        debugPrint("API call success")
                        debugPrint(response)
                        if let value = response.data {
                            let model = ResponseHandler<Z>().handleResponse(jsonData: value, model: Z.self)
                            successBlock(model)
                        }
                        else {
                            successBlock(nil)
                        }
                    case let .failure(error):
                        debugPrint(error)
                        errorBlock(error)
            }
        }
    }
    
    
    
    func get<T:Codable, Z: Codable>(parameters: T, successBlock: @escaping (Z?) -> (), errorBlock: @escaping (Error) -> ()?) {
        
        AF.request(baseUrl+route,
                   method: .get,
                   parameters: parameters
            
        )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                    case .success:
                        debugPrint("API call success")
                        debugPrint(response)
                        if let value = response.data {
                            let model = ResponseHandler<Z>().handleResponse(jsonData: value, model: Z.self)
                            successBlock(model)
                        }
                        else {
                            successBlock(nil)
                        }
                    case let .failure(error):
                        debugPrint(error)
                        errorBlock(error)
            }
        }
    }
}
