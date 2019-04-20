//
//  HomeRouter.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 25/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//

import UIKit

enum HomeRouterEvent {
    case CardButtonTapped
    case BalanceButtonTapped
    case CertificatedButtonTapped
    case TransferButtonTapped
    case InformationButtonTapped
    case LogoffButtonTapped
}

class HomeRouter {
    
    // MARK: - Segue
    enum HomeSegue {
        case changePassword
    }
    
    private let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    
    func react(to event: HomeRouterEvent, from source: UIViewController, info: Any?) {
        switch event {
        case .CardButtonTapped: break
        case .BalanceButtonTapped: break
        case .CertificatedButtonTapped: break
        case .TransferButtonTapped: break
        case .InformationButtonTapped: break
        case .LogoffButtonTapped: break
        }
    }
    
}

// MARK: - Navigation
private extension HomeRouter {
    
    func perform(_ segue: HomeSegue, from source: UIViewController, to controller: UIViewController) {
        switch segue {
        case .changePassword:
            source.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

