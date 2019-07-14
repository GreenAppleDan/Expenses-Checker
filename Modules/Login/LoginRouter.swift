//
//  LoginLoginRouter.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    // Mark: LoginRouterProtocol methods
    func showExpensesView() {
        viewController.performSegue(withIdentifier: viewController.selfToExpensesSegueName, sender: nil)
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // add code if info needed in segue
    }
    
    
//    func moveToSignUpView() {
//        viewController.performSegue(withIdentifier: viewController.selfToSignUpLoginSegue, sender: nil)
//    }
    
    
    weak var viewController: LoginViewController!
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
}

