//
//  NextVCViewController.swift
//  ProjectStructure
//
//  Created by osx on 17/01/19.
//  Copyright © 2019 osx. All rights reserved.
//


import UIKit

class CustomTabBarController: UITabBarController {
    
    private var label = { (text:String) -> Label in
        let label = Label(textAlignment: .center, fontType: .bold, fontSize: .text_15)
        label.textColor = .white
        label.text = text
        return label
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        tabBar.barTintColor = .primaryColor
        let homeVC = ViewController()
        homeVC.view.backgroundColor = .red
        let homeTabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home_selected"), selectedImage:#imageLiteral(resourceName: "home_selected"))
        homeTabBarItem.tag = 0
        homeVC.tabBarItem = homeTabBarItem
        let homeLabel = label("Home")
        homeVC.view.addSubview(homeLabel)
        homeLabel.fillSuperView()
        
        let investVC = ViewController()
        investVC.view.backgroundColor = .gray
        let investTabBarItem = UITabBarItem(title: "Invest", image: #imageLiteral(resourceName: "invest_unselected"), selectedImage:#imageLiteral(resourceName: "invest_selected"))
        investTabBarItem.tag = 1
        investVC.tabBarItem = investTabBarItem
        let investLabel = label("Invest")
        investVC.view.addSubview(investLabel)
        investLabel.fillSuperView()
        
        let newsVC = ViewController()
        newsVC.view.backgroundColor = .purple
        let newsTabBarItem = UITabBarItem(title: "News", image: #imageLiteral(resourceName: "news_unnselected"), selectedImage:#imageLiteral(resourceName: "news_selected"))
        newsTabBarItem.tag = 2
        newsVC.tabBarItem = newsTabBarItem
        let newsLabel = label("News")
        newsVC.view.addSubview(newsLabel)
        newsLabel.fillSuperView()
        
        let profileVC = ViewController()
        profileVC.view.backgroundColor = .blue
        let profileTabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile_unselected"), selectedImage:#imageLiteral(resourceName: "profile_selected"))
        profileTabBarItem.tag = 3
        profileVC.tabBarItem = profileTabBarItem
        let profileLabel = label("Profile")
        profileVC.view.addSubview(profileLabel)
        profileLabel.fillSuperView()
        viewControllers = [homeVC,investVC,newsVC,profileVC]
    }
}

extension CustomTabBarController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        let direction:Direction = toVC.tabBarItem.tag > fromVC.tabBarItem.tag ? .right : .left
        return TabBarControllerTransitioning(direction: direction)
    }
}



class TabBarControllerTransitioning:NSObject, UIViewControllerAnimatedTransitioning {
    
    init(direction:Direction) {
        self.direction = direction
    }
    
    private var direction:Direction = .right
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(UINavigationControllerHideShowBarDuration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let duration = 1.5 * transitionDuration(using: transitionContext)
        let container = transitionContext.containerView
        container.addSubview(toView)
        let x = toView.frame.width
        let isRight = direction == .right
        let translationX = isRight ? x : -x
        toView.transform = CGAffineTransform(translationX: translationX, y: 0)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            toView.transform = .identity
            fromView.transform = CGAffineTransform(translationX: isRight ? -x : x , y: 0)
        }) { (finished) in
            fromView.transform = .identity
            transitionContext.completeTransition(true)
        }
    }
    
    
}
enum Direction{
    case right
    case left
}




