//
//  ExpenseTypePickerView.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 12/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit
protocol ExpenseTypePickerViewProtocol: class {
    var arrayExpenseTypes: [String] {set get}
//    var selectedExpenseTypeIndex: Int? {set get}
//    func reload()
}

protocol ExpenseTypePickerViewDelegate {
    func ExpenseTypePickerViewApplyButtonClicked(selectedRow: Int)
}

class ExpenseTypePickerView: UIView , UIPickerViewDelegate , UIPickerViewDataSource , ExpenseTypePickerViewProtocol {
    
    var arrayExpenseTypes = ExpensesTypes.arrayOfExpensesTypes
    //MARK: Outlets
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: Actions
    @IBAction func applyButtonClicked(_ sender: UIButton) {
        
        delegate?.ExpenseTypePickerViewApplyButtonClicked(selectedRow: pickerView.selectedRow(inComponent: componentIndex))
    }
    
    
    //MARK Variables
        var delegate: ExpenseTypePickerViewDelegate?
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
            Bundle.main.loadNibNamed("ExpenseTypePickerView", owner: self, options: nil)
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
        return arrayExpenseTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayExpenseTypes[row]
    }
    
}






