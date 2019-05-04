//
//  IssueCellViewModel.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 21/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//


import Foundation

protocol IssueCellViewModel {
    var issueItem: Issue { get }
}

extension Issue: IssueCellViewModel {
    var issueItem: Issue {
        return self
    }
}
