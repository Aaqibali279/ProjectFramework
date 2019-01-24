//
//  Bank.swift
//  Project
//
//  Created by Aqib Ali on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import Foundation
struct Bank:Decodable {
    var bankName:String?
    var accountNumber:String?
}

class Currency:Decodable {
    var results:Result?
}

class Result: Decodable {
    var USD_INR:USDINR?
}

class USDINR: Decodable {
    var id:String?
    var val:Double?
    var to:String?
    var fr:String?
}
