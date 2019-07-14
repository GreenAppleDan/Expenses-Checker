//
//  SignUpSignUpProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

protocol SignUpViewProtocol: class {
}

protocol SignUpPresenterProtocol: class {
    var router: SignUpRouterProtocol! { set get }
    func configureView()
    func closeButtonClicked()
    func signUpButtonClicked(email:String , password: String)
}

protocol SignUpInteractorProtocol: class {
    func signUpButtonClicked(email:String , password: String)
}

protocol SignUpRouterProtocol: class {
    func closeCurrentViewController()
}

protocol SignUpConfiguratorProtocol: class {
    func configure(with viewController: SignUpViewController)
}
