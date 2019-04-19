//
//  Issue.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class Issue {
    let id: Int?
    let project: AssignedTo?
    let tracker: AssignedTo?
    let status: AssignedTo?
    let priority: AssignedTo?
    let author: AssignedTo?
    let assignedTo: AssignedTo?
    let subject: String?
    let description: String?
    let startDate: String?
    let doneRatio: Int?
    let estimatedHours: Int?
    let customFields: [CustomFieldIssue]?
    let createdOn: Date?
    let updatedOn: Date?
    
    init(id: Int?, project: AssignedTo?, tracker: AssignedTo?, status: AssignedTo?, priority: AssignedTo?, author: AssignedTo?, assignedTo: AssignedTo?, subject: String?, description: String?, startDate: String?, doneRatio: Int?, estimatedHours: Int?, customFields: [CustomFieldIssue]?, createdOn: Date?, updatedOn: Date?) {
        self.id = id
        self.project = project
        self.tracker = tracker
        self.status = status
        self.priority = priority
        self.author = author
        self.assignedTo = assignedTo
        self.subject = subject
        self.description = description
        self.startDate = startDate
        self.doneRatio = doneRatio
        self.estimatedHours = estimatedHours
        self.customFields = customFields
        self.createdOn = createdOn
        self.updatedOn = updatedOn
    }
}
