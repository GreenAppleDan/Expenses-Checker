//
//  MainMainRouter.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class MainRouter: MainRouterProtocol {

    
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    // MARK: MainRouterProtocol methods
    
    func moveToLogin() {
        viewController.performSegue(withIdentifier: viewController.selfToLoginSegueName, sender: nil)
    }
    
    func moveToAddEvent()  {
        viewController.performSegue(withIdentifier: viewController.selfToAddEvent , sender: nil)
    }
    
    func moveToReports() {
        viewController.performSegue(withIdentifier: viewController.selfToReport , sender: nil)
    }
    
}

