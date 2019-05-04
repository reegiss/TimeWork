//
//  CustomField.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class CustomField: Codable {
    let id: Int?
    let name: String?
    let value: String?
    
    init(id: Int?, name: String?, value: String?) {
        self.id = id
        self.name = name
        self.value = value
    }
}
