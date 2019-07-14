//
//  SignUpSignUpInteractor.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class SignUpInteractor: SignUpInteractorProtocol {
    
    func signUpButtonClicked(email: String, password: String) {
        
    }
    
    
    weak var presenter: SignUpPresenterProtocol!
    
    required init(presenter: SignUpPresenterProtocol) {
        self.presenter = presenter
    }   
}

