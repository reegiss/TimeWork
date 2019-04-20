//
//  JSON.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 07/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//


import Foundation

class JSON {
    
    class func serialize(dictionary: [String: Any]) -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return jsonData
        } catch {
            // Return nil if serialization fails
            return nil
        }
    }
    
    class func deserialize(data: Data) -> [String: Any]? {
        do {
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return jsonDict as? [String: Any]
        } catch {
            return nil
        }
    }
}

