//
//  ReportReportInteractor.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class ReportInteractor: ReportInteractorProtocol {

    weak var presenter: ReportPresenterProtocol!
    
    required init(presenter: ReportPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getDataForPieChart(fromDate: Date) {
        let realmService = RealmService()
        let arrayOfEvents = realmService.getArrayOfMoneyEventsFilteredWithDate(date: fromDate)
        presenter.setupViewForShowingPieChart(arrayOfEvents: arrayOfEvents)
    }
}

