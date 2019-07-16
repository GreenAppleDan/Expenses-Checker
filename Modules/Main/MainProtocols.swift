//
//  MainMainProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol MainViewProtocol: class {
    var modelsArray : [EventInfoCellmodel] {get set}
    func updateModelsArray(_ array: [EventInfoCellmodel])
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureView()
    func logOutButtonClicked()
    func showAddEventView()
    func eventsDidRecieve(_ arrayOfEvents: [Expenses])
    func viewWillAppear()
    func reportButtonCLicked()
    
}

protocol MainInteractorProtocol: class {
    var realmService: RealmServiceProtocol? {get set}
    func getEvents()
    
}

protocol MainRouterProtocol: class {
    func moveToLogin ()
    func moveToAddEvent()
    func moveToReports()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
