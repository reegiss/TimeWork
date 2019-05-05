//
//  Issue.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class Issue: Codable {
    let id: Int?
    let project: Project?
    let tracker:  Tracker?
    let status: Status?
    let subject: String?
    let description: String?
    let startDate: String?
    let doneRatio: Int?
    let estimatedHours: Int?
    let totalEstimatedHours: Int?
    let spentHours: Double?
    let totalSpentHours: Double?
    let createdOn: Date?
    let updatedOn: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case project
        case tracker
        case status
        case subject
        case description
        case startDate = "start_date"
        case doneRatio = "done_ratio"
        case estimatedHours = "estimated_hours"
        case totalEstimatedHours = "total_estimated_hours"
        case spentHours = "spent_hours"
        case totalSpentHours = "total_spent_hours"
        case createdOn = "created_on"
        case updatedOn = "updated_on"
    }
    
    init(id: Int?, project: Project?, tracker: Tracker?, status: Status?, subject: String?, description: String?, startDate: String?, doneRatio: Int?, estimatedHours: Int?, totalEstimatedHours: Int?, spentHours: Double?, totalSpentHours: Double?, createdOn: Date?, updatedOn: Date?) {
        self.id = id
        self.project = project
        self.tracker = tracker
        self.status = status
        self.subject = subject
        self.description = description
        self.startDate = startDate
        self.doneRatio = doneRatio
        self.estimatedHours = estimatedHours
        self.totalEstimatedHours = totalEstimatedHours
        self.spentHours = spentHours
        self.totalSpentHours = totalSpentHours
        self.createdOn = createdOn
        self.updatedOn = updatedOn
    }
}

class Status: Codable {
    let id: Int?
    let name: String?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
