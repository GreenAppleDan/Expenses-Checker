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
        setDataForCenterLabelInChart(label: "Tap Chart To See %")
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
        
        //changing center text and deselecting previosly selected entry in piechhart
        view.pieChartView.highlightValue(nil)
        setDataForCenterLabelInChart(label: "Tap Chart To See %")
        
        //setting up data for chart
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
    }
    
    func chartValueSelected(value: PieChartDataEntry){
        var expensesCombined = Double(0)
        for dataEntry in view.dataEntryArray! {
            expensesCombined += dataEntry.value
        }
        let valueInPercentage = Double(round(100000 * value.value / expensesCombined)/1000)
        setDataForCenterLabelInChart(label: value.label! + ": " + String(valueInPercentage) + "%")
    }
    
    func setDataForCenterLabelInChart(label: String) {
    let centerTextAttribute = [ NSAttributedString.Key.font: UIFont(name: "futura", size: 14.0)!]
    let centerText = NSAttributedString(string: label, attributes: centerTextAttribute)
    view.pieChartView.centerAttributedText = centerText
    }
    
    
}

