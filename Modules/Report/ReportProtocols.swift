//
//  ReportReportProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
import Charts
protocol ReportViewProtocol: class {
    var dataEntryArray: [PieChartDataEntry]? {get set}
    var colors: [UIColor]? {get set}
    func updateChartData()
}

protocol ReportPresenterProtocol: class {
    var router: ReportRouterProtocol! { set get }
    func configureView()
    func prepareDataForPieChart(time: TimeForReportToShow)
    func setupViewForShowingPieChart(arrayOfEvents: [Expenses])
    func backButtonPressed()
    
}

protocol ReportInteractorProtocol: class {
//    date!.timeIntervalSince1970
    func getDataForPieChart(fromDate: Date)
}

protocol ReportRouterProtocol: class {
    func moveToMain()
}

protocol ReportConfiguratorProtocol: class {
    func configure(with viewController: ReportViewController)
}
