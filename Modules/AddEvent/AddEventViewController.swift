//
//  AddEventAddEventViewController.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class AddEventViewController: UIViewController, AddEventViewProtocol {
    var eventDate: Date?
    var amountOfMoney: Int?
    var eventType: String?
    
    
    @IBOutlet weak var eventTypeTextField: UITextField!
    @IBOutlet weak var moneyAmountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var ExpenseTypePickerView: ExpenseTypePickerView!
    
    @IBOutlet weak var offsetBottonExpenseTypePicker: NSLayoutConstraint!
    
    
    @IBAction func AddButtonClicked(_ sender: Any) {
        if eventDate != nil , amountOfMoney != nil , eventType != nil {
            presenter.addButtonClicked(eventType: eventType!, moneyAmount: amountOfMoney!, eventDate: eventDate!)
            presentAlert(title: "Success!", message: "Event added successfully!")
        } else {
            presentAlert(title: "Error" , message: "Fill all fields" )
        }
    }
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startedEditingEventTypeTextField(_ sender: UITextField) {
        eventTypeTextField.resignFirstResponder()
        presenter.startedEditingEventTypeTextField()
        
    }
    
    //MARK interactor sets date and type
    @IBAction func moneyAmountDidEndEditing(_ sender: UITextField) {
        amountOfMoney = Int(moneyAmountTextField.text!)
    }
    
    
    //    @IBAction func valueChangedEventTypeTextField(_ sender: UITextField) {
    //    }
    
    var datePicker : UIDatePicker!
    var tapGesture : UITapGestureRecognizer!
    
    var presenter: AddEventPresenterProtocol!
    let configurator: AddEventConfiguratorProtocol = AddEventConfigurator()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    func showPickerView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetBottonExpenseTypePicker.constant = -self.ExpenseTypePickerView.frame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    func hidePickerView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetBottonExpenseTypePicker.constant = self.ExpenseTypePickerView.frame.size.height
            self.view.layoutIfNeeded()
        }
    }
    
    func presentAlert(title: String , message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController , animated: true , completion: nil)
    }
    
    func setEventTypeTextField (text: String) {
        self.eventTypeTextField.text = text
    }
    
    func setDateTextField() {
        self.dateTextField.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        presenter.checkDate(date: datePicker.date)
    }
    
    func addGestureRecognizer(gesture:UITapGestureRecognizer) {
        view.addGestureRecognizer(gesture)
    }
    
    func changeDateTextField(with:String){
        dateTextField.text = with
    }
    
    
    //    func setInputViewOnEventTypeTextField (object: ExpenseTypePickerViewProtocol) {
    //        eventTypeTextField.inputView = object as! UIView
    //    }
    
}


