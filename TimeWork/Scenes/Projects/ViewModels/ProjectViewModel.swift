//
//  ProjectViewModel.swift
//  TimeWork
//
//  Created by Regis Araujo Melo on 20/04/19.
//  Copyright © 2019 Supera Tecnologia. All rights reserved.
//

import Foundation
import RxSwift

class ProjectViewModel {
    
    enum ProjectTableViewCellType {
        case normal(cellViewModel: ProjectCellViewModel)
        case error(message: String)
        case empty
    }
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    let projectCells = Bindable([ProjectTableViewCellType]())
    
    let service = ProjectServices()
    var projectResponse: ProjectResponse?
    var projectsResponse: ProjectsResponse?
    
    
    // MARK: - Service
    func loadProject(id: String) -> Observable<ProjectResponse?> {
        return Observable.create { observable in
            self.service.loadProject(idProject: id, success: { (exampleResponse, serviceResponse) in
                if let response = exampleResponse  {
                    self.projectResponse = response
                    observable.onNext(self.projectResponse)
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
    
    func loadAllProject(id: Int) -> Observable<ProjectsResponse?> {
        return Observable.create { observable in
            self.service.loadAllProject(limit: "", success: { (exampleResponse, serviceResponse) in
                if let response = exampleResponse  {

                    let list = response.projects?.filter {
                        $0.parent?.id == id
                    }
                    self.projectCells.value = list!.compactMap {
                        ProjectTableViewCellType.normal(cellViewModel: $0 as ProjectCellViewModel)
                    }
                    self.projectsResponse = response
                    observable.onNext(self.projectsResponse)
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
