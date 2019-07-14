//
//  RealmService.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 11/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol RealmServiceProtocol {
    func setDefaultRealmForUser(username:String)
    func addEvent(eventType: String, moneyAmount: Int, eventDate: Date)
    func getArrayOfMoneyEvents() -> [Expenses]
}

class RealmService: RealmServiceProtocol {
    
    func setDefaultRealmForUser(username:String) {
        var config = Realm.Configuration()
        
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    func addEvent(eventType: String, moneyAmount: Int, eventDate: Date) {
        let realm = try! Realm()
        let expense = Expenses()
        expense.date = eventDate
        expense.moneyAmount = moneyAmount
        expense.type = eventType
        try! realm.write {
           realm.add(expense)
        }
    }
    
    func getArrayOfMoneyEvents() -> [Expenses] {
        let realm = try! Realm()
        let arrayOfResults = realm.objects(Expenses.self)
        var arrayOfEvents = [Expenses]()
        for event in arrayOfResults{
            arrayOfEvents.append(event)
        }
        return arrayOfEvents.sorted(by: {$0.date!.timeIntervalSince1970 > $1.date!.timeIntervalSince1970 })
        
        
    }
    
    
}
