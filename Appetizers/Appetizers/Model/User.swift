//
//  User.swift
//  Appetizers
//
//  Created by Nhut Huynh Quang on 31/8/24.
//

import Foundation

struct User: Codable {
    
    var firtsName       = ""
    var lastName        = ""
    var email           = ""
    var birthday        = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
