//
//  ProfileViewModel.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewModel {
    
    let service = ProfileServices()
    var loginResponse: LoginResponse?
    
    // MARK: - Service
    func loadProfile(token: String) -> Observable<LoginResponse?> {
        return Observable.create { observable in
            self.service.loadProfile(token: token, success: { (exampleResponse, serviceResponse) in
                if let response = exampleResponse  {
                    self.loginResponse = response
                    observable.onNext(self.loginResponse)
                }
            }, onFailure: { (serviceResponse) in
                if let error = serviceResponse?.serviceError {
                    observable.onError(error)
                }
            }, onCompletion: {
                observable.onCompleted()
            })
            return Disposables.create()
        }
    }
}
