//
//  IssueViewModels.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation
import RxSwift

class IssueViewModel {
    
    let service = IssueServices()
    var issuesResponse: IssuesResponse?
    
    enum IssueTableViewCellType {
        case normal(cellViewModel: IssueCellViewModel)
        case error(message: String)
        case empty
    }
    
    let issueCells = Bindable([IssueTableViewCellType]())
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    func loadIssueAssigned(assigned: String) -> Observable<IssuesResponse?> {
        return Observable.create { observable in
            self.service.getIssueAssignedTo(assigned: assigned, success: { (exampleResponse, serviceResponse) in
                if let response = exampleResponse  {
                    
                    self.issueCells.value = response.issues!.compactMap {
                        IssueTableViewCellType.normal(cellViewModel: $0 as IssueCellViewModel)
                    }
                    self.issuesResponse = response
                    observable.onNext(self.issuesResponse)
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
