//
//  AddEventAddEventRouter.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class AddEventRouter: AddEventRouterProtocol {
    
    weak var viewController: AddEventViewController!
    
    init(viewController: AddEventViewController) {
        self.viewController = viewController
    }
}

