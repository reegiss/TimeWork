//
//  IssueTableViewCell.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 21/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation
import UIKit

class IssueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelProjectName: UILabel!
    
    var viewModel: IssueCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        labelId.text = String(describing: viewModel?.issueItem.id ?? 0)
        labelName?.text = viewModel?.issueItem.description
        labelSubject?.text = viewModel?.issueItem.subject
        labelProjectName.text = viewModel?.issueItem.project?.name
    }
}
