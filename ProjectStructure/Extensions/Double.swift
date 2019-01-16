//
//  Double.swift
//  ProjectStructure
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import Foundation
extension Double{
    func date(dateFormat:Format) -> String?{
        let date = Date(timeIntervalSince1970: self/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat.rawValue
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    var cleanValue5: String{
        return String(format: "%.5f", self) // "1.12345"
    }
    
    var cleanValue2: String{
        return String(format: "%.2f", self) // "1.12"
    }
}
