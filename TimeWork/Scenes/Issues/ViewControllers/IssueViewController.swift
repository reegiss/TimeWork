//
//  IssueViewController.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

class IssueViewController: UITableViewController {
    
    var disposeBag = DisposeBag()
    var viewModel = IssueViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.loadIssueAssigned(assigned: "me")
    }
    
    func bindViewModel() {
        viewModel.issueCells.bindAndFire() { [weak self] _ in
            //            self?.tableView?.reloadData()
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
            }
        }
        
        viewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        
        viewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                visible ? PKHUD.sharedHUD.show(onView: self.view) : PKHUD.sharedHUD.hide()
            }
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailIssue",
            let destinationViewController = segue.destination as? IssueDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
//                destinationViewController.idIssue.text? = "Teste"
            
            switch viewModel.issueCells.value[indexPath.row] {
            case .normal(let viewModel):
//                destinationViewController.parentId = (viewModel.projectItem.id)!
                destinationViewController.title = (viewModel.issueItem.tracker?.name)! + " " +  String(describing: viewModel.issueItem.id!)
                destinationViewController.issue = viewModel.issueItem
            case .empty, .error:
                // nop
                break
            }
        }
    }

}

extension IssueViewController {
    
    func loadIssueAssigned(assigned: String) {
        HUD.show(.progress)
        self.viewModel.loadIssueAssigned(assigned: assigned).observeOn(MainScheduler.instance).subscribe(onNext: { (response) in
            if response != nil {
                //self.arrayProjects = response?.projects
                
            }
            
        }, onError: { (error) in
            self.showAlertMessage(message: "Não foi possivel carregar dados!")
        }, onCompleted: {
        }, onDisposed: {
            HUD.hide()
        }).disposed(by: disposeBag)
    }
}


// MARK: - Table view data source
extension IssueViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.issueCells.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.issueCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "issueCell") as? IssueTableViewCell else {
                return UITableViewCell()
            }
            
            cell.viewModel = viewModel
            return cell
        case .error(let message):
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = "sem registros"
            return cell
        }
    }
}
