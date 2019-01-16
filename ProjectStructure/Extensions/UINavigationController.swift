//
//  UINavigationController.swift
//  ProjectStructure
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
extension UINavigationController{
    /**
     It removes all view controllers from navigation controller then set the new root view controller and it pops.
     
     - parameter vc: root view controller to set a new
     */
    func setRootViewController(vc: UIViewController){
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }
}
