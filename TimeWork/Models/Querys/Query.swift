//
//  Query.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class Query: Codable {
    let id: Int?
    let name: String?
    let isPublic: Bool?
    let projectId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isPublic = "is_public"
        case projectId = "project_id"
    }
    
    init(id: Int?, name: String?, isPublic: Bool?, projectId: Int?) {
        self.id = id
        self.name = name
        self.isPublic = isPublic
        self.projectId = projectId
    }
}
