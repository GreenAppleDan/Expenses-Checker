//
//  AddEventAddEventInteractor.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class AddEventInteractor: AddEventInteractorProtocol {
    
    var realmService: RealmServiceProtocol?
    
    weak var presenter: AddEventPresenterProtocol!
    
    required init(presenter: AddEventPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: AddEventInteractorPROTOCOL methods
    
    func isDateValid(date:Date) {
        let currentDate = Date()
        if currentDate < date {
            presenter.setDateTextFieldInView(date: currentDate)
        } else {
            presenter.setDateTextFieldInView(date: date)
        }
    }
    
    func addNewEventToRealm(eventType: String, moneyAmount: Int, eventDate: Date) {
    realmService?.addEvent(eventType: eventType , moneyAmount: moneyAmount, eventDate: eventDate)
    }
}

