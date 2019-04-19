//
//  BlurEffect.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func addBlurArea(area: CGRect, style: UIBlurEffect.Style, alpha: CGFloat) {
        let effect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: effect)
        let container = UIView(frame: area)
        blurView.frame = CGRect(x: 0, y: 0, width: area.width, height: area.height)
        container.addSubview(blurView)
        container.alpha = alpha
        self.view.insertSubview(container, at: 1)
    }
}
