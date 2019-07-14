//
//  Expenses.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 11/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol ExpensesProtocol {
    var type: String {get set}
    var moneyAmount: Int {get set}
    var date: Date? {get set}
}
class Expenses: Object , ExpensesProtocol {
    @objc dynamic var type = ""
    @objc dynamic var moneyAmount = 0
    @objc dynamic var date: Date? = nil
    
}
