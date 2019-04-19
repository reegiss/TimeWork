//
//  URLInfo.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit

class URLInfo {
    
    static func url(fromKey key: String) -> String {
        guard
            let path = Bundle.main.path(forResource: "URLs", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String]
            else {
                return ""
        }
        
        if let url = dict[key] {
            return (url)
        } else {
            return ""
        }
    }
}
