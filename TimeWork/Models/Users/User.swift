//
//  User.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 18/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class User: Codable {
    let id: Int?
    let login: String?
    let firstname: String?
    let lastname: String?
    let createdOn: Date?
    let lastLoginOn: Date?
    let apiKey: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case firstname
        case lastname
        case createdOn
        case lastLoginOn
        case apiKey = "api_key"
    }
    
    init(id: Int?, login: String?, firstname: String?, lastname: String?, createdOn: Date?, lastLoginOn: Date?, apiKey: String?) {
        self.id = id
        self.login = login
        self.firstname = firstname
        self.lastname = lastname
        self.createdOn = createdOn
        self.lastLoginOn = lastLoginOn
        self.apiKey = apiKey
    }
}
