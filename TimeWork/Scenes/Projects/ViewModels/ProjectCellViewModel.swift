//
//  ProjectCellViewModel.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

protocol ProjectCellViewModel {
    var projectItem: Project { get }
}

extension Project: ProjectCellViewModel {
    var projectItem: Project {
        return self
    }
}
