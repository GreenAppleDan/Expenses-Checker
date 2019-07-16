//
//  ReportReportPresenter.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
import Charts
class ReportPresenter: ReportPresenterProtocol , DatePickerViewDelegate {

    
    var datePickerView: DatePickerViewProtocol!
    weak var view: ReportViewProtocol!
    var interactor: ReportInteractorProtocol!
    var router: ReportRouterProtocol!
    
    required init(view: ReportViewProtocol) {
        self.view = view
    }
    
    // MARK: - ReportPresenterProtocol methods
    
    func configureView() {
        prepareDataForPieChart(time: .month)
    }
    
    func prepareDataForPieChart(time: TimeForReportToShow) {
        
        switch time {
        case .week : interactor.getDataForPieChart(fromDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!)
        case .month :
            interactor.getDataForPieChart(fromDate: Calendar.current.date(byAdding: .month , value: -1, to: Date())!)
        case .yearHalf :
            interactor.getDataForPieChart(fromDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!)
        case .year :
            interactor.getDataForPieChart(fromDate: Calendar.current.date(byAdding: .year, value: -1, to: Date())!)
            
        }
    }
    
    func setupViewForShowingPieChart(arrayOfEvents: [Expenses]) {
        var dictWithInfo = [String:Int]()
        var colors = [UIColor]()
        var arrayOfDataEntries = [PieChartDataEntry]()
        
        for event in arrayOfEvents {
            let currentAmount = dictWithInfo[event.type] ?? 0
            dictWithInfo[event.type] = currentAmount + event.moneyAmount
        }
        
        for (type,amount) in dictWithInfo {
            colors.append(UIColor(named: type)!)
            let entry = PieChartDataEntry(value: Double(amount))
            entry.label = type
            arrayOfDataEntries.append(entry)
        }
        
        view?.colors = colors
        view?.dataEntryArray = arrayOfDataEntries
        view?.updateChartData()
    }
    
    func backButtonPressed(){
        router.moveToMain()
    }
    
    func DatePickerViewApplyButtonClicked(selectedRow: Int) {
        let dateString = datePickerView.arrayOfTimes[selectedRow]
        view.hidePickerView()
        view.changeDateButtonName(to: dateString)
        
        switch dateString{
        case TimeForReportToShow.week.rawValue:
            prepareDataForPieChart(time: .week)
        case TimeForReportToShow.month.rawValue:
            prepareDataForPieChart(time: .month)
        case TimeForReportToShow.yearHalf.rawValue:
            prepareDataForPieChart(time: .yearHalf)
        case TimeForReportToShow.year.rawValue:
            prepareDataForPieChart(time: .year)
        default: print("error")
        }
        
//        view.eventType = ExpensesTypes.arrayOfExpensesTypes[selectedRow]
//        view.hidePickerView()
//        view.setEventTypeTextField(text: ExpensesTypes.arrayOfExpensesTypes[selectedRow])
    }
}

