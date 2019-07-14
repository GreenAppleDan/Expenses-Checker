//
//  AddEventAddEventProtocols.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import UIKit
protocol AddEventViewProtocol: class {
    func showPickerView()
    func hidePickerView()
    func setEventTypeTextField (text:String)
    func setDateTextField()
    func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    func addGestureRecognizer(gesture:UITapGestureRecognizer)
    func dateChanged(datePicker: UIDatePicker)
    func presentAlert(title: String , message: String)
    var datePicker : UIDatePicker! { get set }
    var tapGesture: UITapGestureRecognizer! { get set }
    func changeDateTextField(with:String)
    var eventDate: Date? {get set}
    var amountOfMoney: Int? {get set}
    var eventType: String? {get set}
    
    //    func setInputViewOnEventTypeTextField (object: ExpenseTypePickerViewProtocol)
}

protocol AddEventPresenterProtocol: class {
    var expenseTypePickerView: ExpenseTypePickerViewProtocol! {set get}
    var router: AddEventRouterProtocol! { set get }
    func configureView()
    func startedEditingEventTypeTextField()
    func checkDate(date:Date)
    func setDateTextFieldInView(date:Date)
    func addButtonClicked(eventType:String , moneyAmount:Int , eventDate: Date)
}

protocol AddEventInteractorProtocol: class {
    //    func expenseTypeChanged(selectedIndex: Int)
    var realmService: RealmServiceProtocol? {get set}
    func isDateValid(date:Date)
    func addNewEventToRealm(eventType: String, moneyAmount: Int, eventDate: Date)
}

protocol AddEventRouterProtocol: class {
}

protocol AddEventConfiguratorProtocol: class {
    func configure(with viewController: AddEventViewController)
}
