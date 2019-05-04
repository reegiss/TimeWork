//
//  LoginViewController.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift
import PKHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var serverTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var disposeBag = DisposeBag()
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.serverTextField.text = "https://projetos.supera.com.br"
        self.loginTextField.text = "regis.melo"
        self.passwordTextField.text = "thmpv-8913"
        self.login()
//        self.addBlurArea(area: self.view.frame, style: .light, alpha: 0.8)
    }
    

    @IBAction func login(_ sender: Any) {
        self.login()
    }
    

}

extension LoginViewController {
    func login() {
        guard let userText = self.loginTextField.text else {return }
        guard let passwordText = self.passwordTextField.text else {return}
        HUD.show(.progress)
        self.viewModel.login(user: userText, password: passwordText)
            .observeOn(MainScheduler.instance).subscribe(onNext: { (response) in
                if response != nil {
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "NavigatorViewController") as! NavigatorViewController
                    self.present(vc, animated: true, completion: nil)
                }
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    HUD.flash(.success, delay: 1.0)
                }
            }, onError: { (error) in
                self.showAlertMessage(message: "Usuário ou senha incorreto(s)!")
            }, onCompleted: {
            }, onDisposed: {
                HUD.hide(afterDelay: 0.5)
            }).disposed(by: disposeBag)
    }
}
