//
//  String.swift
//  ProjectStructure
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
extension String{
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
    mutating func removeFirst() -> String{
        let index = String.Index.init(encodedOffset: 0)
        self.remove(at: index)
        return self
    }
    
    func date() -> String?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else{
            return nil
        }
        dateFormatter.dateFormat = "MMM d hh:mm a"
        let dateString = dateFormatter.string(from: date)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
}
