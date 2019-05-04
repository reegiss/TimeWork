//
//  RootProject.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 21/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation

class RootProject: Codable {
    let id: Int?
    let name: String?
    let children: [NodeProject] = []
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

class NodeProject: Codable {
    var id: Int?
    var name: String?
    var children: [NodeProject] = []
    weak var parent: NodeProject?
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
    
    func add(child: NodeProject) {
        children.append(child)
        child.parent = self
    }
}
