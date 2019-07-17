//
//  LoginLoginPresenter.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    
    
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    required init(view: LoginViewProtocol) {
        self.view = view
        
    }
    
    //MARK: Action methods
    
    func loginButtonClicked(username:String) {
        UserDefaults.standard.set(username, forKey: "username")
        interactor.loginButtonClicked(username: username)
    }
    
    
    // MARK: - LoginPresenterProtocol methods
    
    func configureView() {
    }
    
    func showExpensesView() {
        router.showExpensesView()
    }
    
    func checkIfUserAlreadyLoggedIn() {
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        if username != "" {
            loginButtonClicked(username: username)
        } else {
            view.makeWholeViewVisible()
        }
    }
}

