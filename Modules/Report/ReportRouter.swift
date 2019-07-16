//
//  ReportReportRouter.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import Foundation
import UIKit

class ReportRouter: ReportRouterProtocol {
    
    weak var viewController: ReportViewController!
    
    init(viewController: ReportViewController) {
        self.viewController = viewController
    }
    
    func moveToMain(){
        viewController.performSegue(withIdentifier: "fromReportToMain", sender: nil)
    }
    
}

