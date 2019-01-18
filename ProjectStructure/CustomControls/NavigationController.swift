//
//  NavigationController.swift
//  ProjectStructure
//
//  Created by osx on 17/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
class NavigationController: UINavigationController,UINavigationControllerDelegate {
    
    
    func transitionAnimations(enable:Bool){
        delegate = enable ? self : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return Transitioning(opertaion: operation)
    }
    
    func setRootViewController(vc: UIViewController){
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }
}

class Transitioning: NSObject,UIViewControllerAnimatedTransitioning {
    
    init(opertaion:UINavigationControllerOperation) {
        self.opertaion = opertaion
    }
    
    private var opertaion:UINavigationControllerOperation = .pop
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(UINavigationControllerHideShowBarDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }

        let duration = 1.5 * transitionDuration(using: transitionContext)
        let container = transitionContext.containerView
        let animationView:UIView
        
        switch opertaion {
        case .push:
            toView.frame = fromView.frame
            animationView = toView
        case .pop:
            container.addSubview(toView)
            animationView = fromView
        default:
            return
        }
        
        let leftFrame  =  CGRect(x: 0, y: 0, width: animationView.frame.width/2, height: animationView.frame.height)
        let rightFrame  =  CGRect(x: animationView.frame.width/2, y: 0, width: animationView.frame.width/2, height: animationView.frame.height)
        
        let leftImg = image(view: animationView, bounds: leftFrame, isOpaque: animationView.isOpaque)
        let rightImg = image(view: animationView, bounds: rightFrame, isOpaque: animationView.isOpaque)
        
        let leftIV = UIImageView(frame: CGRect(origin: CGPoint.init(x: 0, y: animationView.frame.minY), size: leftFrame.size))
        leftIV.image = leftImg
        container.addSubview(leftIV)
        
        let rightIV = UIImageView(frame: CGRect.init(origin: CGPoint.init(x: animationView.frame.width/2, y: animationView.frame.minY), size: rightFrame.size))
        rightIV.image = rightImg
        container.addSubview(rightIV)
        
        let translationX = animationView.frame.width/2
        let isPush = opertaion == .push
        
        leftIV.transform = CGAffineTransform(translationX: isPush ? -translationX : 0, y: 0)
        rightIV.transform = CGAffineTransform(translationX: isPush ? translationX : 0, y: 0)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            leftIV.transform = CGAffineTransform(translationX: isPush ? 0 : -translationX , y: 0)
            rightIV.transform = CGAffineTransform(translationX: isPush ? 0 : translationX , y: 0)
        }) { (finished) in
            if isPush{
                container.addSubview(toView)
            }
            leftIV.removeFromSuperview()
            rightIV.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
    func image(view:UIView,bounds:CGRect,isOpaque:Bool) -> UIImage{
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let image = renderer.image(actions: { (rendererContext) in
            view.layer.render(in: rendererContext.cgContext)
        })
        return image
    }
    
}


