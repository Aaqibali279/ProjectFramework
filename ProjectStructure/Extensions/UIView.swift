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
        addConstraint(aspectRatio)
    }
    
    
    func fillSuperview(){
        anchor(leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor, top: superview?.topAnchor, bottom: superview?.bottomAnchor)
    }
    
    func centerInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview{
            centerXAnchor.constraint(equalTo:superview.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        }
    }
    
    func anchorSize(to view:UIView,multiplier:CGSize = .init(width: 1, height: 1)) {
        translatesAutoresizingMaskIntoConstraints = false
        if multiplier.width != 0{
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier.width).isActive = true
        }
        if multiplier.height != 0{
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier.height).isActive = true
        }
    }
    
    
    
    func anchor(leading:NSLayoutXAxisAnchor? = nil,trailing:NSLayoutXAxisAnchor? = nil,top:NSLayoutYAxisAnchor? = nil,bottom:NSLayoutYAxisAnchor? = nil,padding:UIEdgeInsets = .zero,size:CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading,constant:padding.left).isActive = true
        }
        
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing,constant:-padding.right).isActive = true
        }
        
        if let top = top{
            topAnchor.constraint(equalTo: top,constant:padding.top).isActive = true
        }
        
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom,constant:-padding.bottom).isActive = true
        }
        
        
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
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
