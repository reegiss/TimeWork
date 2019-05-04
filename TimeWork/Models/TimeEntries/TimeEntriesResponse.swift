//
//  TimeEntriesResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class TimeEntriesResponse: Codable {
    let timeEntries: [TimeEntry]?
    let totalCount: Int?
    let offset: Int?
    let limit: Int?
    
    init(timeEntries: [TimeEntry]?, totalCount: Int?, offset: Int?, limit: Int?) {
        self.timeEntries = timeEntries
        self.totalCount = totalCount
        self.offset = offset
        self.limit = limit
    }
}

class TimeEntry: Codable {
    let id: Int?
    let project: Activity?
    let issue: Issue?
    let user: Activity?
    let activity: Activity?
    let hours: Double?
    let comments: String?
    let spentOn: String?
    let createdOn: String?
    let updatedOn: String?
    
    init(id: Int?, project: Activity?, issue: Issue?, user: Activity?, activity: Activity?, hours: Double?, comments: String?, spentOn: String?, createdOn: String?, updatedOn: String?) {
        self.id = id
        self.project = project
        self.issue = issue
        self.user = user
        self.activity = activity
        self.hours = hours
        self.comments = comments
        self.spentOn = spentOn
        self.createdOn = createdOn
        self.updatedOn = updatedOn
    }
}

class Activity: Codable {
    let id: Int?
    let name: String?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
