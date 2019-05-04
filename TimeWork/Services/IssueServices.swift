//
//  IssueServices.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class IssueServices {
    
    func getIssue(loginRequest: IssueRequest, success: @escaping ((_ sucessObject: IssuesResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getAllIssueUrl()) {
            
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ example: IssuesResponse?, _ serviceResponse: ServiceResponse?) in
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
    
    func getIssueAssignedTo(assigned: String, success: @escaping ((_ sucessObject: IssuesResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getIssueAssignedToUrl(assigned: assigned)) {
            
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ example: IssuesResponse?, _ serviceResponse: ServiceResponse?) in
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
