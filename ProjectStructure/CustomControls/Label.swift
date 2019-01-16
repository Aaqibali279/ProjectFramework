//
//  Label.swift
//  ProjectStructure
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

enum FontType:String{
    case bold = "AvenirNext-Bold"
    case demi_bold = "AvenirNext-DemiBold"
    case medium = "AvenirNext-Medium"
    case regular = "AvenirNext-Regular"
    case light = "AvenirNext-UltraLight"
}

enum FontSize:CGFloat {
    case title_45 = 45
    case title_35 = 35
    case sub_title_28 = 28
    case sub_title_25 = 25
    case sub_title_22 = 22
    case text_20 = 20
    case text_15 = 15
}

import UIKit
class Label: UILabel {
    init(textAlignment:NSTextAlignment,fontType:FontType,fontSize:FontSize) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        numberOfLines = 0
        baselineAdjustment = .alignCenters
        minimumScaleFactor = 0.30
        textColor = .black
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: fontType.rawValue, size: fontSize.rawValue)
    }
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("CustomLabel deallocated")
    }
}
