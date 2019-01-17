//
//  View.swift
//  ProjectStructure
//
//  Created by osx on 17/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit

class View: UIView {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    func dropShadow() {
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
