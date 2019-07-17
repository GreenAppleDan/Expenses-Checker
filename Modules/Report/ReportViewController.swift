//
//  ReportReportViewController.swift
//  Expenses Checker
//
//  Created by Denis on 14/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit
import Charts

class ReportViewController: UIViewController, ReportViewProtocol {
    
    var dataEntryArray: [PieChartDataEntry]?
    var colors: [UIColor]?
    
    @IBOutlet weak var datePickerView: DatePickerView!
    
    
    @IBOutlet weak var offsetDatePickerConstant: NSLayoutConstraint!
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        presenter.backButtonPressed()
    }
    
    @IBAction func changeDateButtonCLicked(_ sender: UIBarButtonItem) {
        showPickerView()
    }
    
    @IBOutlet weak var dateButton: UIBarButtonItem!
    
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var presenter: ReportPresenterProtocol!
    let configurator: ReportConfiguratorProtocol = ReportConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {


        pieChartView.chartDescription?.textAlign = .left
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateChartData()
    }
    
    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: dataEntryArray, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        chartDataSet.colors = colors! 
        
        pieChartView.data = chartData
        
        
    }
    
    func showPickerView() {
        view.bringSubviewToFront(datePickerView)
        pieChartView.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.5) {
            self.offsetDatePickerConstant.constant = -self.datePickerView.frame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    func hidePickerView() {
        pieChartView.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.5) {
            self.offsetDatePickerConstant.constant = self.datePickerView.frame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    func changeDateButtonName(to: String){
        dateButton.title = to
    }
}

extension ReportViewController: ChartViewDelegate{
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        presenter.chartValueSelected(value: entry as! PieChartDataEntry)

    }
}


