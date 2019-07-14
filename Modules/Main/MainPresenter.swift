//
//  MainMainPresenter.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    // MARK: - MainPresenterProtocol methods
    
    func configureView() {
        interactor.getEvents()
    }
    
    func viewWillAppear(){
        interactor.getEvents()
    }
    
    func logOutButtonClicked() {
        router.moveToLogin()
    }
    
    func showAddEventView() {
        router.moveToAddEvent()
    }
    
    func eventsDidRecieve(_ arrayOfEvents: [Expenses]) {
        var arrayOfCellModels = [EventInfoCellmodel]()
        for event in arrayOfEvents {
            let cellModel = EventInfoCellmodel(expense: event)
            arrayOfCellModels.append(cellModel)
            view?.updateModelsArray(arrayOfCellModels)
        }
    }
}

