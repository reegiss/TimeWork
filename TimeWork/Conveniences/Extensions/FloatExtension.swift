//
//  FloatExtension.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 07/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//


import Foundation
import UIKit


enum CurrencyLocales :  String {
    case brazil = "pt_BR"
    case localeDefault = "en_US"
}

extension Float {
    func currentLocaleCurrencyString(value: String) -> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier:value)
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    
    func currencySymbol(value: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: value)
        return formatter.locale.currencySymbol ?? ""
        
    }
}

