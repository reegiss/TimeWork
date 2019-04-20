//
//  BottomAlertController.swift
//  BIIS-Usuario
//
//  Created by Thiago Henrique Pereira Freitas de Paula on 01/03/18.
//  Copyright © 2018 BIIS. All rights reserved.
//

import Foundation
import UIKit

class BottomAlertController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var textLabel: UILabel!
    
    // MARK: - Properties
    var text: String?
    
    // MARK: Instantiation
    static func instantiateNew(withText text: String) -> BottomAlertController {
        
        // Storyboard
        let storyboard = UIStoryboard(name: "Modals", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BottomAlertController
        
        // TextLabel
        controller.text = text
        
        return controller
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    // MARK: UI Configuration
    func setupUI(){
        textLabel.text = text
    }
}

