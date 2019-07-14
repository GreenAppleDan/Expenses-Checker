//
//  MainMainProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol MainViewProtocol: class {
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    func configureView()
    func logOutButtonClicked()
    func showAddEventView()
}

protocol MainInteractorProtocol: class {
}

protocol MainRouterProtocol: class {
    func moveToLogin ()
    func moveToAddEvent()
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
