//
//  DateExtension.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 14/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//
import UIKit

extension Date {
    static func getFormattedDateAsString(date:Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return dateFormatter.string(from: date)
    }
}
