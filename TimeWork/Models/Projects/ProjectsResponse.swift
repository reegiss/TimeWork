//
//  ProjectsResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class ProjectsResponse: Codable {
    let projects: [Project]?
    let totalCount: Int?
    let offset: Int?
    let limit: Int?
    
    init(projects: [Project]?, totalCount: Int?, offset: Int?, limit: Int?) {
        self.projects = projects
        self.totalCount = totalCount
        self.offset = offset
        self.limit = limit
    }
}
