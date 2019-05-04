//
//  ProjectViewController.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

class ProjectViewController: UITableViewController {
    
    var disposeBag = DisposeBag()
    var viewModel = ProjectViewModel()
    var arrayProjects: [Project]?
    private let cellIdentifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.loadAllProject()
        
    }
    
    func bindViewModel() {
        viewModel.projectCells.bindAndFire() { [weak self] _ in
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
        
        if segue.identifier == "detailProject",
            let destinationViewController = segue.destination as? SubProjectViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
            switch viewModel.projectCells.value[indexPath.row] {
            case .normal(let viewModel):
                destinationViewController.parentId = (viewModel.projectItem.id)!
                destinationViewController.title = viewModel.projectItem.name
            case .empty, .error:
                // nop
                break
            }
        }
    }
    
    
}

// MARK: - Table view data source
extension ProjectViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projectCells.value.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.projectCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as? ProjectTableViewCell else {
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

extension ProjectViewController {
    func loadProject(id: String) {
        
        self.view.startLoading()
        self.viewModel.loadProject(id: id).observeOn(MainScheduler.instance).subscribe(onNext: { (response) in
            if response != nil {
                
            }
            
        }, onError: { (error) in
            self.showAlertMessage(message: "Não foi possivel carregar dados!")
        }, onCompleted: {
        }, onDisposed: {
            self.view.stopLoading()
        }).disposed(by: disposeBag)
    }
    
    func loadAllProject() {
        
        self.view.startLoading()
        self.viewModel.loadAllProject(id: 131).observeOn(MainScheduler.instance).subscribe(onNext: { (response) in
            if response != nil {
                self.arrayProjects = response?.projects
                
            }
            
        }, onError: { (error) in
            self.showAlertMessage(message: "Não foi possivel carregar dados!")
        }, onCompleted: {
        }, onDisposed: {
            self.view.stopLoading()
        }).disposed(by: disposeBag)
    }
}
