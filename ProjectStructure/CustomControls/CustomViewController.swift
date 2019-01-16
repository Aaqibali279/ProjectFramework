//
//  CustomViewController.swift
//  ChoiceInvest
//
//  Created by osx on 08/10/18.
//  Copyright © 2018 osx. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController,UIGestureRecognizerDelegate{

    //MARK:- PROPERTIES
    var screenHeight:CGFloat = 0
    var statusBarHeight:CGFloat =  0
    
    let cache = NSCache<AnyObject, AnyObject>()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryColor
        view.tintColor = .primaryColor
        screenHeight = UIScreen.main.bounds.size.height
        statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsDisplay()
        view.layoutIfNeeded()
        
        cache.removeAllObjects()
        
    }
    
    func setKeyboardGesture(){
        setGesture(view: view, selector: #selector(viewAction))
    }
    @objc func viewAction(){
        view.endEditing(true)
    }
    
    func setGesture(view:UIView,selector:Selector) {
        let gesture = UITapGestureRecognizer.init(target: self, action: selector)
        gesture.delegate = self
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: false)
    }
    
    func animateConstraint(constraint:NSLayoutConstraint,constant:CGFloat,duration:Double){
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {  [weak self] in
            constraint.constant = constant
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setBackButtonInNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.tintColor = .white
        let leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func setNavBarTitle(title:NSMutableAttributedString){
        if let navBar = navigationController?.navigationBar{
            let titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.frame = CGRect(x: 0, y: 0, width: navBar.frame.width/2, height: navBar.frame.height)
            titleLabel.center = navBar.center
            titleLabel.attributedText = title
            navigationItem.titleView = titleLabel
        }
    }
    
    func setNavBar(){
        navigationController?.isNavigationBarHidden = false
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white.withAlphaComponent(0.40)
        navigationController?.navigationBar.barTintColor = .primaryColor
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
   
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewController(forKey: .from)
        guard let toViewController = transitionContext.viewController(forKey: .to) else{
            return
        }
        let finalFrameForVC = transitionContext.finalFrame(for: toViewController)
        let containerView = transitionContext.containerView
        let bounds = UIScreen.main.bounds
        toViewController.view.frame = toViewController.view.frame.offsetBy(dx: 0, dy: bounds.size.height)
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            fromViewController?.view.alpha = 0.5
            toViewController.view.frame = finalFrameForVC
        }, completion: {
            finished in
            transitionContext.completeTransition(true)
            fromViewController?.view.alpha = 1.0
        })
    }
    //MARK:- TOAST
    func showToast(message:String?,isFailure:Bool = false,toastCompletion: ((Bool) -> ())? = nil){
        toastLabel.text = message
        
        let x = view.frame.width * 0.5
        let y = view.frame.height * 0.7
        let width = view.frame.width * 0.8
        var textHeight = view.frame.height * 0.045
        let textWidth = view.frame.width * 0.7
        var delay = 0.7
        
        if let font = UIFont.init(name: FontType.regular.rawValue, size: FontSize.text_15.rawValue){
            if let message = message{
                textHeight = message.height(withConstrainedWidth: textWidth, font: font)
                delay = Double(message.count) * 0.03
            }
        }
        
        let size = CGSize(width: width, height: textHeight + 18)
        let center = CGPoint(x: x, y: y)
        
        view.addSubview(toastView)
        
        toastView.frame.size = size
        toastView.center = center
        
        toastView.addSubview(toastLabel)
        toastView.backgroundColor = isFailure ? .red : .green
        
        toastLabel.centerXAnchor.constraint(equalTo: toastView.centerXAnchor).isActive = true
        toastLabel.centerYAnchor.constraint(equalTo: toastView.centerYAnchor).isActive = true
        toastLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        toastLabel.heightAnchor.constraint(equalToConstant: textHeight).isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.toastView.alpha = 1
        }) { (finshed) in
            UIView.animateKeyframes(withDuration: 0.5, delay: delay, options: [], animations: { [weak self] in
                self?.toastView.alpha = 0
            }, completion: { [weak self] (finshed) in
                self?.toastView.removeFromSuperview()
                self?.toastLabel.removeFromSuperview()
                
                toastCompletion?(true)
            })
        }
    }
    
    private var toastView = { () -> UIView in
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    var uiView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private var toastLabel = { () -> Label in
        let label = Label(textAlignment: .center, fontType: .regular, fontSize: FontSize.text_15)
        return label
    }()
    //MARK:- CheckBoxes/RadioButtons
    func animate(button:UIButton){
        button.transform = CGAffineTransform.init(scaleX: 1.8, y: 1.8)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            button.transform = .identity
        })
    }
    
    func appDelegate() -> AppDelegate?{
       return UIApplication.shared.delegate as? AppDelegate
    }
    
    
    deinit {
        print("CustomViewController deallocated")
    }
}
