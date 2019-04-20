//
//  UIViewControllerExtension.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 07/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//


import Foundation
import UIKit

public extension UIViewController {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showAlertError(for error: Error) {
        guard let serviceError = error as? ServiceError, let alertText = serviceError.message else { return }
        let bottomAlertController = BottomAlertController.instantiateNew(withText: alertText)
        self.present(bottomAlertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func showAlertMessage(message: String) {
        let bottomAlertController = BottomAlertController.instantiateNew(withText: message)
        self.present(bottomAlertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func animateTextField(textField: UITextField, up: Bool, withOffset offset:CGFloat)
    {
        let movementDistance : Int = -Int(offset)
        let movementDuration : Double = 0.3
        let movement : Int = (up ? movementDistance : -movementDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: CGFloat(movement))
        UIView.commitAnimations()
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.animateTextField(textField: textField, up: true, withOffset: textField.frame.origin.y / 2)
        
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.animateTextField(textField: textField, up: false, withOffset: textField.frame.origin.y / 2)
        
    }
    
    
}




