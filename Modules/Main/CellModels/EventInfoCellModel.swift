//
//  EventInfoCellModel.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 14/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation

//class EmployeeBaseInfoCellModel: EmployeeBaseCellModel {
//    override var cellIdentifier: String {
//        return "EmployeeBaseInfoCell"
//    }
//
//    var name: String
//    var specialization: String
//    var imageURL: URL?
//
//    init(_ employee: Employee) {
//        name = employee.name
//        specialization = employee.specialization
//        imageURL = employee.imageURL
//    }
//}

class EventInfoCellmodel: EventBaseCellModel{
    override var cellIdentifier: String {
        return "EventInfoCell"
    }
    
    var eventType: String
    var moneyAmount: Int
    var date: Date
    
    init(expense: Expenses) {
        eventType = expense.type
        moneyAmount = expense.moneyAmount
        date = expense.date!
    }
}
