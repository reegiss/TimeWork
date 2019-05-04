//
//  ProfileServices.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit

class ProfileServices {
    
    func loadProfile(token: String, success: @escaping ((_ sucessObject: LoginResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getCurrentUserUrl()) {
            
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ example: LoginResponse?, _ serviceResponse: ServiceResponse?) in
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
