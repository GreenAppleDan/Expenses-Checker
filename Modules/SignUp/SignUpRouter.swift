//
//  SignUpSignUpRouter.swift
//  Expenses Checker
//
//  Created by Denis on 10/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class SignUpRouter: SignUpRouterProtocol {
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    weak var viewController: SignUpViewController!
    
    init(viewController: SignUpViewController) {
        self.viewController = viewController
    }
}

