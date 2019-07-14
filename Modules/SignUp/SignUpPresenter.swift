//
//  SignUpSignUpPresenter.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    //MARK: Actions
    func closeButtonClicked() {
        router.closeCurrentViewController()
    }
    
    func signUpButtonClicked(email: String, password: String) {
        interactor.signUpButtonClicked(email: email, password: password)
    }
    
    
    weak var view: SignUpViewProtocol!
    var interactor: SignUpInteractorProtocol!
    var router: SignUpRouterProtocol!
    
    required init(view: SignUpViewProtocol) {
        self.view = view
    }
    
    // MARK: - SignUpPresenterProtocol methods
    
    func configureView() {

    }
}

