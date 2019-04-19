//
//  User.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 18/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class User {
    let id: Int?
    let login: String?
    let firstname: String?
    let lastname: String?
    let createdOn: Date?
    let lastLoginOn: Date?
    let apiKey: String?
    let customFields: [CustomField]?
    
    init(id: Int?, login: String?, firstname: String?, lastname: String?, createdOn: Date?, lastLoginOn: Date?, apiKey: String?, customFields: [CustomField]?) {
        self.id = id
        self.login = login
        self.firstname = firstname
        self.lastname = lastname
        self.createdOn = createdOn
        self.lastLoginOn = lastLoginOn
        self.apiKey = apiKey
        self.customFields = customFields
    }
}
