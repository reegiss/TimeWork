//
//  IssuesResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class IssuesResponse {
    let issues: [Issue]?
    let totalCount: Int?
    let offset: Int?
    let limit: Int?
    
    init(issues: [Issue]?, totalCount: Int?, offset: Int?, limit: Int?) {
        self.issues = issues
        self.totalCount = totalCount
        self.offset = offset
        self.limit = limit
    }
}
