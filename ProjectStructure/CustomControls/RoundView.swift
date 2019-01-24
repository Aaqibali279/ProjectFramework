//
//  RoundView.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
class RoundView: UIView {
    private var radiusMultiplier:CGFloat = 0
    init(radiusMultiplier:CGFloat = 0.5,backgroundColor:UIColor = .white) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.radiusMultiplier = radiusMultiplier
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = frame.height * radiusMultiplier
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateCornerRadius(from: CGFloat, to: CGFloat, duration: CFTimeInterval){
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        layer.add(animation, forKey: "cornerRadius")
        layer.cornerRadius = to
    }
    deinit {
        print("RoundView deallocated")
    }
}

