//
//  MainMainInteractor.swift
//  Expenses Checker
//
//  Created by Denis on 11/07/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import UIKit
import Realm
class MainInteractor: MainInteractorProtocol {
    
   var realmService: RealmServiceProtocol?
 
    
    weak var presenter: MainPresenterProtocol!
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    
    func getEvents() {
       let eventsArray =  realmService!.getArrayOfMoneyEvents()
        presenter.eventsDidRecieve(eventsArray)
//        let realm = try! Realm()
//        let moneyEvents = realm.objects(Expenses.self)
    }
    
}

