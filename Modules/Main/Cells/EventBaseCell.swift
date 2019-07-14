//
//  EventBaseCell.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 14/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit

class EventBaseCell : UITableViewCell , ModelRepresentable {
    var model: CellIdentifiable? {
        didSet{
            updateViews()
        }
    }
    func updateViews() {
        
    }
}
