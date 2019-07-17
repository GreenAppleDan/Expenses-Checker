//
//  LoginLoginProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
protocol LoginViewProtocol: class {
}

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol! { set get }
    func configureView()
    func loginButtonClicked(username:String)
    func showExpensesView()
    func checkIfUserAlreadyLoggedIn()
    
}

protocol LoginInteractorProtocol: class {
    func loginButtonClicked(username:String)
    var realmService: RealmServiceProtocol? {set get}
}

protocol LoginRouterProtocol: class {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func showExpensesView()
}

protocol LoginConfiguratorProtocol: class {
    func configure(with viewController: LoginViewController)
}
