//
//  ProjectServices.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation
import Alamofire

class ProjectServices {
    
    enum GetProjectsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetProjectsResult = Result<[Project], GetProjectsFailureReason>
    typealias GetProjectsCompletion = (_ result: GetProjectsResult) -> Void
    
    
    
    func loadProject(idProject: String, success: @escaping ((_ sucessObject: ProjectResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getOneProjectUrl(id: idProject)) {
            
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ example: ProjectResponse?, _ serviceResponse: ServiceResponse?) in
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
    
    func loadAllProject(limit: String = "100", success: @escaping ((_ sucessObject: ProjectsResponse?,  _ serviceResponse: ServiceResponse?) -> Void), onFailure failure:((ServiceResponse?) -> Void)? = nil, onCompletion completion:(() -> Void)? = nil) {
        if let url = URL(string: Endpoint.getAllProjectsUrl()) {
            
            Service.shared.request(httpMethod: .get, url: url, payload: nil, auth: true).response(succeed: { (_ example: ProjectsResponse?, _ serviceResponse: ServiceResponse?) in
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
    
//    func getProject(completion: @escaping GetProjectsCompletion) {
//        Alamofire.request(Endpoint.getAllProjectsUrl())
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success:
//                    do {
//                        guard let data = response.data else {
//                            completion(.failure(nil))
//                            return
//                        }
//                        
//                        let friends = try JSONDecoder().decode([Project].self, from: data)
//                        completion(.success(payload: friends))
//                    } catch {
//                        completion(.failure(nil))
//                    }
//                case .failure(_):
//                    if let statusCode = response.response?.statusCode,
//                        let reason = GetProjectsFailureReason(rawValue: statusCode) {
//                        completion(.failure(reason))
//                    }
//                    completion(.failure(nil))
//                }
//        }
//    }
}
