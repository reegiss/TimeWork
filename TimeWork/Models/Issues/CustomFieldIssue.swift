//
//  CustomFieldIssue.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class CustomFieldIssue {
    let id: Int?
    let name: String?
    let multiple: Bool?
    let value: Value?
    
    init(id: Int?, name: String?, multiple: Bool?, value: Value?) {
        self.id = id
        self.name = name
        self.multiple = multiple
        self.value = value
    }
}
