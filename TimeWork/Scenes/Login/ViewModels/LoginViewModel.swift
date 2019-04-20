//
//  LoginViewModel.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 19/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewModel {
    
    let service = LoginServices()
    var loginResponse: LoginResponse?
    
    // MARK: - Service
    func login(user: String, password: String) -> Observable<LoginResponse?> {
        return Observable.create { observable in
            let loginRequest = LoginRequest()
            loginRequest.login = user
            loginRequest.password = password
            self.service.login(loginRequest: loginRequest, success: { (exampleResponse, serviceResponse) in
                if let response = exampleResponse  {
                    self.loginResponse = response
                    Session.shared.token = self.loginResponse?.user?.apiKey
//                    Session.shared.federalId = self.loginResponse?.federalId
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
