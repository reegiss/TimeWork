//
//  Endpoint.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

public enum EndpointType {
    
    case REDMINE
    
    var baseUrl: String {
        switch self {
        case .REDMINE: return URLInfo.url(fromKey: "baseUrl")
        }
    }
}

class Endpoint {
    
    static func getCurrentUserUrl() -> String {
        return EndpointType.REDMINE.baseUrl+URLInfo.url(fromKey: "currentUser")
    }
    
    static func getAllIssueUrl() -> String {
        return EndpointType.REDMINE.baseUrl+URLInfo.url(fromKey: "allIssues")
    }
    
}
