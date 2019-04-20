//
//  SideMenuTableViewController.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 03/04/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//

import UIKit
import Foundation
import SideMenu

class SideMenuTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // refresh cell blur effect in case it changed
        tableView.reloadData()
        
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
    }

}
