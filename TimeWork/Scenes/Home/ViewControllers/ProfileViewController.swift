//
//  ProfileViewController.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var disposeBag = DisposeBag()
    var viewModel = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadProfile()
    }

}

extension ProfileViewController {
    func loadProfile() {
        
        self.view.startLoading()
        self.viewModel.loadProfile(token: Session.shared.token!)
            .observeOn(MainScheduler.instance).subscribe(onNext: { (response) in
                if response != nil {
                    self.nameTextField.text = response?.user?.firstname
                }
                
            }, onError: { (error) in
                self.showAlertMessage(message: "Não foi possivel carregar dados!")
            }, onCompleted: {
            }, onDisposed: {
                self.view.stopLoading()
            }).disposed(by: disposeBag)
    }
}
