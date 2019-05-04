//
//  ProjectTableViewCell.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelIdentifier: UILabel!
    
    var viewModel: ProjectCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        labelName?.text = viewModel?.projectItem.name
        labelIdentifier?.text = viewModel?.projectItem.description
    }
}
