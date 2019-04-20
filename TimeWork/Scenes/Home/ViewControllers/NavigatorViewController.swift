//
//  NavigatorViewController.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 08/04/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//

import UIKit

class NavigatorViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - Instantiation
extension NavigatorViewController {
    static func instantiate(fromStoryboard storyboard: UIStoryboard) -> NavigatorViewController {
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! NavigatorViewController
    }
}
