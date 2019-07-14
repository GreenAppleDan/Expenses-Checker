//
//  EventInfoCell.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 14/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation


import UIKit

//class EmployeeBaseInfoCell: EmployeeBaseCell {
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var specializationLabel: UILabel!
//    @IBOutlet weak var photoImageView: UIImageView!
//
//    override func updateViews() {
//        guard let model = model as? EmployeeBaseInfoCellModel else {
//            return
//        }
//
//        nameLabel.text = model.name
//        specializationLabel.text = model.specialization
//        if let imagePath = model.imageURL?.path {
//            photoImageView.image = UIImage(contentsOfFile: imagePath)
//        }
//    }
//}

class EventInfoCell: EventBaseCell {
    
    @IBOutlet weak var expenseTypeLabel: UILabel!
    
    @IBOutlet weak var moneyAmountLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func updateViews() {
        guard let model = model as? EventInfoCellmodel else {
            return
        }
        expenseTypeLabel.text = model.eventType
        moneyAmountLabel.text = String(model.moneyAmount) + "₽"
        dateLabel.text = Date.getFormattedDateAsString(date: model.date)
    }
}
