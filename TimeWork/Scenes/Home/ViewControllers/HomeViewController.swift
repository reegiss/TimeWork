//
//  HomeViewController.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 21/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//

import UIKit
import RxSwift
import SideMenu

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let router = HomeRouter()
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
    }

    
}

extension HomeViewController {
    // MARK: - Lifecycle
    fileprivate func setupSideMenu() {
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.init(red: 192/255, green: 111/255, blue: 39/255, alpha: 1.0)
        
        SideMenuManager.default.menuWidth = view.frame.width - 60
        SideMenuManager.default.menuShadowOpacity = 1.0
        SideMenuManager.default.menuPresentMode = .menuSlideIn
//        SideMenuManager.default.menuAnimationTransformScaleFactor = 0.97
    }
    
    
}
// MARK: - Instantiation
extension HomeViewController {
    static func instantiate(fromStoryboard storyboard: UIStoryboard) -> HomeViewController {
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }
}

