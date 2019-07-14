//
//  LoginLoginInteractor.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class LoginInteractor: LoginInteractorProtocol {
    var realmService: RealmServiceProtocol?
    
    weak var presenter: LoginPresenterProtocol!
    
    required init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: Interactor calls
    func loginButtonClicked(username:String) {
        realmService?.setDefaultRealmForUser(username: username)
        presenter.showExpensesView()
    }
}

