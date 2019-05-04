//
//  TrackersResponse.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class TrackersResponse: Codable {
    let trackers: [Tracker]?
    
    init(trackers: [Tracker]?) {
        self.trackers = trackers
    }
}

class Tracker: Codable {
    let id: Int?
    let name: String?
    let defaultStatus: DefaultStatus?
    
    init(id: Int?, name: String?, defaultStatus: DefaultStatus?) {
        self.id = id
        self.name = name
        self.defaultStatus = defaultStatus
    }
}

class DefaultStatus: Codable {
    let id: Int?
    let name: String?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}
