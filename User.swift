//
//  User.swift
//  Expenses Checker
//
//  Created by Денис Жукоборский on 11/07/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

protocol UserProtocol {
    var email: String {get set}
    var password: String {get set}
}
class User: Object , UserProtocol {
    @objc dynamic var email = ""
    @objc dynamic var password = ""
}

