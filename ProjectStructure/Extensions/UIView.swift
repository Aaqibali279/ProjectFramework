//
//  UIView.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
extension UIView{
    func setAspectRatio(multiplier:CGFloat){
        let aspectRatio = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: multiplier, constant: 0)
        self.addConstraint(aspectRatio)
    }
    
    func fillSuperView(){
        guard let superview = superview else { return }
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
    
    func vibrate() {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = 3
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        layer.add(shake, forKey: "position")
    }
}
