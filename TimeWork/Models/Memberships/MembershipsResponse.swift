//
//  MembershipsResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class MembershipsResponse: Codable {
    let memberships: [Membership]?
    let totalCount: Int?
    let offset: Int?
    let limit: Int?
    
    init(memberships: [Membership]?, totalCount: Int?, offset: Int?, limit: Int?) {
        self.memberships = memberships
        self.totalCount = totalCount
        self.offset = offset
        self.limit = limit
    }
}

class Membership: Codable {
    let id: Int?
    let project: Project?
    let user: Project?
    let roles: [Role]?
    
    init(id: Int?, project: Project?, user: Project?, roles: [Role]?) {
        self.id = id
        self.project = project
        self.user = user
        self.roles = roles
    }
}

class Role: Codable {
    let id: Int?
    let name: String?
    let inherited: Bool?
    
    init(id: Int?, name: String?, inherited: Bool?) {
        self.id = id
        self.name = name
        self.inherited = inherited
    }
}
