//
//  AddEventAddEventConfigurator.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class AddEventConfigurator: AddEventConfiguratorProtocol {
    
    func configure(with viewController: AddEventViewController) {
        let presenter = AddEventPresenter(view: viewController)
        let interactor = AddEventInteractor(presenter: presenter)
        let router = AddEventRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        presenter.expenseTypePickerView = viewController.ExpenseTypePickerView
        viewController.ExpenseTypePickerView.delegate = presenter
        
        interactor.realmService = RealmService()
    }
}
