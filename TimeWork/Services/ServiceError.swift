//
//  ServiceError.swift
//  Example
//
//  Created by Thiago on 18/01/19.
//  Copyright © 2019 ValeCard. All rights reserved.
//

import Foundation

struct ServiceError: Codable, Error {
  
  // MARK: - Properties
  var code: String? // Do i reely need this?
  var title: String? // Do i reely need this?
  var detail: String? // Do i reely need this?
  
  var statusCode: Int? // This is coming from the service
  var error: String? // This is coming from the service
  var message: String? // This is coming from the service
  
}
