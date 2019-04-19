//
//  TutorialViewController.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 22/03/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit


class TutorialViewController: UIViewController {
    
    enum ErrorToThrow: Error {
        case notConectivity
    }
    
    @IBOutlet weak var buttonIgnoreTutorial: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var bgHeader: UIImageView!
    
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tutorialPageViewController = segue.destination as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork() {
            print("conexao ok")
        } else {
            print("sem conexao")
        }
                
        self.addBlurArea(area: self.view.frame, style: .dark, alpha: 0.8)
        
        // Do any additional setup after loading the view.
        pageControl.addTarget(self, action: Selector(("didChangePageControlValue")), for: .valueChanged)
        
    }
    
    func didChangePageControlValue() {
        tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    @IBAction func changeStoryboard (sender: UIButton) {
        if Reachability.isConnectedToNetwork() {
            let storyboard = UIStoryboard(name: "login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "loginStoryBoard") as UIViewController
            present(vc, animated: true, completion: nil)
        } else {
            print("sem conexao")
        }
    }
    
}
