//
//  AddEventAddEventPresenter.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
class AddEventPresenter: AddEventPresenterProtocol , ExpenseTypePickerViewDelegate {
 
    
    
    weak var view: AddEventViewProtocol!
    var interactor: AddEventInteractorProtocol!
    var router: AddEventRouterProtocol!
    var expenseTypePickerView: ExpenseTypePickerViewProtocol!
    
    required init(view: AddEventViewProtocol) {
        self.view = view
    }
    
    // MARK: - AddEventPresenterProtocol methods
    
    func configureView() {
        //        view.setInputViewOnEventTypeTextField(object: expenseTypePickerView)
        view?.datePicker = UIDatePicker()
        view?.datePicker.datePickerMode = .date
        view?.setDateTextField()
        view?.datePicker.addTarget(view, action: #selector(AddEventViewController.dateChanged(datePicker:)), for: .valueChanged)
        view?.tapGesture = UITapGestureRecognizer(target: view, action: #selector(AddEventViewController.viewTapped(gestureRecognizer:)))
        view?.addGestureRecognizer(gesture: view.tapGesture)
    }
    
    //MARK ExpenseTypePickerViewDelegate
    func ExpenseTypePickerViewApplyButtonClicked(selectedRow: Int) {
        view.eventType = ExpensesTypes.arrayOfExpensesTypes[selectedRow]
        view.hidePickerView()
        view.setEventTypeTextField(text: ExpensesTypes.arrayOfExpensesTypes[selectedRow])
        //        interactor.expenseTypeChanged(selectedIndex: selectedRow)
    }
    
    func addButtonClicked(eventType: String, moneyAmount: Int, eventDate: Date) {
        interactor.addNewEventToRealm(eventType: eventType, moneyAmount: moneyAmount, eventDate: eventDate)
    }
    
    func startedEditingEventTypeTextField() {
        //         expenseTypePickerView?.arrayExpenseTypes = ExpensesTypes.arrayOfExpensesTypes
        //        expenseTypePickerView?.reload()
        //        currencyPickerView?.arrayCurrencyNames = interactor.getCurrencyNames()
        //        currencyPickerView?.reload()
        view.showPickerView()
    }
    
    func checkDate(date:Date) {
        interactor.isDateValid(date:date)
    }
    
    func setDateTextFieldInView(date:Date) {
        view.eventDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        view?.changeDateTextField(with: dateFormatter.string(from:date))
    }
}

