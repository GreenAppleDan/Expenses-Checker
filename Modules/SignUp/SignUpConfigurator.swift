//
//  SignUpSignUpConfigurator.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class SignUpConfigurator: SignUpConfiguratorProtocol {
    
    func configure(with viewController: SignUpViewController) {
        let presenter = SignUpPresenter(view: viewController)
        let interactor = SignUpInteractor(presenter: presenter)
        let router = SignUpRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}