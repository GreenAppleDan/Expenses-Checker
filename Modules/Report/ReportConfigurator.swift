//
//  ReportReportConfigurator.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit

class ReportConfigurator: ReportConfiguratorProtocol {
    
    func configure(with viewController: ReportViewController) {
        let presenter = ReportPresenter(view: viewController)
        let interactor = ReportInteractor(presenter: presenter)
        let router = ReportRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}