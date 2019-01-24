//
//  Date.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

enum Format:String {
    case date = "E, d MMM yy hh:mm a"
    case time = "hh:mm a"
    case day = "E"
    case dayMonth = "d MMM"
    case month = "MMM"
}

import Foundation
extension Date{
    func formatDate(dateFormat:Format)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat.rawValue
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}
