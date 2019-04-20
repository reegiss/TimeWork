//
//  LoginServices.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 15/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//


import UIKit

class LoginServices {
    
    func login(loginRequest: LoginRequest, success: @escaping ((_ sucessObject: LoginResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getCurrentUserUrl()) {
            let loginString = String(format: "%@:%@", loginRequest.login!, loginRequest.password!)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            Service.shared.request(httpMethod: .get, url: url, payload: nil, headers: ["Authorization":"Basic \(base64LoginString)"], auth: false).response(succeed: { (_ example: LoginResponse?, _ serviceResponse: ServiceResponse?) in
                if let response = example, let content = serviceResponse {
                    success(response, content)
                }
                
            }, failed: { (errorResponse) in
                failure?(errorResponse)
            }, completed: {
                completion?()
            })
        }
    }
}




