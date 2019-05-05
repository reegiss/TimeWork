//
//  IssueDetailViewController.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 04/05/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift

class IssueDetailViewController: UIViewController {

    var issue: Issue?
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var statusTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectLabel.text = issue?.subject
        descriptionTextView.text = issue?.description
        statusTextField.text = issue?.status?.name
//        print(issue?.createdOn?.stringToDate())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
