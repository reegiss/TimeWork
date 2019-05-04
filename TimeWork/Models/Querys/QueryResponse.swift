//
//  QueryResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class QueryResponse: Codable {
    let queries: [Query]?
    let totalCount: Int?
    let offset: Int?
    let limit: Int?
    
    init(queries: [Query]?, totalCount: Int?, offset: Int?, limit: Int?) {
        self.queries = queries
        self.totalCount = totalCount
        self.offset = offset
        self.limit = limit
    }
}
