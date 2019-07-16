//
//  DatePickerView.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 16/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit
protocol DatePickerViewProtocol: class {
    var arrayOfTimes: [String] {set get}
    //    var selectedExpenseTypeIndex: Int? {set get}
    //    func reload()
}

protocol DatePickerViewDelegate {
    func DatePickerViewApplyButtonClicked(selectedRow: Int)
}

class DatePickerView: UIView , UIPickerViewDelegate , UIPickerViewDataSource , DatePickerViewProtocol {
    
    var arrayOfTimes: [String] = [TimeForReportToShow.week.rawValue , TimeForReportToShow.month.rawValue , TimeForReportToShow.yearHalf.rawValue , TimeForReportToShow.year.rawValue]
    //MARK: Outlets
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: Actions
    @IBAction func applyButtonClicked(_ sender: UIButton) {
        
        delegate?.DatePickerViewApplyButtonClicked(selectedRow: pickerView.selectedRow(inComponent: componentIndex))
    }
    
    
    //MARK Variables
    var delegate: DatePickerViewDelegate?
    private let numberOfComponents = 1
    private let componentIndex = 0
    
    
    
    
    //MARK inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    
    // MARK: ExpenseTypePickerViewProtocol
    
    //    func reload() {
    //        pickerView.reloadAllComponents()
    //    }
    
    //MARK: UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfTimes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfTimes[row]
    }
    
}







