//
//  Button.swift
//  ProjectStructure
//
//  Created by osx on 18/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
class Button: UIButton {
    init() {
        super.init(frame: .zero)
        titleLabel?.textAlignment = .left
        titleLabel?.numberOfLines = 1
        titleLabel?.baselineAdjustment = .alignCenters
        titleLabel?.minimumScaleFactor = 0.30
        titleLabel?.textColor = .black
        titleLabel?.adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
}
