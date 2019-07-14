//
//  LoginLoginConfigurator.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(with viewController: LoginViewController) {
        let presenter = LoginPresenter(view: viewController)
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.realmService = RealmService()
    }
}
