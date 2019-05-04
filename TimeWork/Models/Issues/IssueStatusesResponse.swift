//
//  IssueStatusesResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class IssueStatusesResponse: Codable {
    let issueStatuses: [IssueStatus]?
    
    init(issueStatuses: [IssueStatus]?) {
        self.issueStatuses = issueStatuses
    }
}

class IssueStatus: Codable {
    let id: Int?
    let name: String?
    let isClosed: Bool?
    
    init(id: Int?, name: String?, isClosed: Bool?) {
        self.id = id
        self.name = name
        self.isClosed = isClosed
    }
}
