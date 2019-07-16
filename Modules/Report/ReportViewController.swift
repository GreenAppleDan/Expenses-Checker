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
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        presenter.backButtonPressed()
    }
    
    @IBAction func changeDateButtonCLicked(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var dateButton: UIBarButtonItem!
    
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var presenter: ReportPresenterProtocol!
    let configurator: ReportConfiguratorProtocol = ReportConfigurator()

    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
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
}


