//
//  ProjectResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class ProjectResponse: Codable {
    let project: Project?
    
    init(project: Project?) {
        self.project = project
    }
}
