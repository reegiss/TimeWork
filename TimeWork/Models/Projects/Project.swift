//
//  Project.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

typealias Projects = [Project]

class Project: Codable {
    let id: Int?
    let name: String?
    let identifier: String?
    let description: String?
    let homepage: String?
    let status: Int?
    let customFields: [CustomField]?
    let createdOn: String?
    let updatedOn: String?
    let parent: Parent?
    
    init(id: Int?, name: String?, identifier: String?, description: String?, homepage: String?, status: Int?, customFields: [CustomField]?, createdOn: String?, updatedOn: String?, parent: Parent?) {
        self.id = id
        self.name = name
        self.identifier = identifier
        self.description = description
        self.homepage = homepage
        self.status = status
        self.customFields = customFields
        self.createdOn = createdOn
        self.updatedOn = updatedOn
        self.parent = parent
    }
}
