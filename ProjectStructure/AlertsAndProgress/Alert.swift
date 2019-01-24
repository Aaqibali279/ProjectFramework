//
//  Alert.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 16/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
class Alert: UIView {
    
    private var windows:UIWindow?
    private var action:UIButton?
    private var cancel:UIButton!
    private var topSep:UIView!
    private var topView:UIView!
    static var instance = Alert()
    
    
    private var actionTitle:String?{
        didSet{
            action?.setTitle(actionTitle, for: .normal)
        }
    }
    
    private init() {
        windows = UIApplication.shared.windows[0]
        super.init(frame: windows!.frame)
        backgroundColor = UIColor.white.withAlphaComponent(0.05)
        self.setUpViews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layoutIfNeeded()
    }
    
    func showAlert(heading:String? = nil,message:String,actionTitle:String? = nil,selector:Selector? = nil, viewController:UIViewController,isDoubleAction:Bool = false){
        setUpLabels(heading: heading, message: message)
        
        if isDoubleAction {
            setDoubleActions()
            self.actionTitle = actionTitle
            if let selector = selector{
                self.action?.addTarget(viewController, action: selector, for: .touchUpInside)
            }
        }else{
            setSingleAction()
        }
        viewController.view.endEditing(true)
        
        DispatchQueue.main.async {
            self.roundView.transform = CGAffineTransform(scaleX: 0.5, y: 2)
            self.windows?.addSubview(self)
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.roundView.transform = .identity
            })
        }
    }
    
    @objc func dismiss() {
        removeFromSuperview()
        cancel.removeFromSuperview()
        action?.removeFromSuperview()
        messageLabel.removeFromSuperview()
        headingLabel.removeFromSuperview()
    }
    
    //MARK:- BELOW IS DESIGN RELATED CODE
    //MARK:- SET UP VIEWS
    private func setUpViews(){
        
        addSubview(roundView)
        roundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        roundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        roundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        roundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        
        topView = uiView()
        roundView.addSubview(topView)
        topView.widthAnchor.constraint(equalTo: roundView.widthAnchor, multiplier: 0.85).isActive = true
        topView.topAnchor.constraint(equalTo: roundView.topAnchor).isActive = true
        topView.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: roundView.heightAnchor,multiplier:0.78).isActive = true
        
        
        topSep = uiView()
        
        topSep.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        roundView.addSubview(topSep)
        topSep.leadingAnchor.constraint(equalTo: roundView.leadingAnchor).isActive = true
        topSep.trailingAnchor.constraint(equalTo: roundView.trailingAnchor).isActive = true
        topSep.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        topSep.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        
        layoutIfNeeded()
    }
    
    private func setUpLabels(heading:String?,message:String){
        topView.addSubview(messageLabel)
        headingLabel.removeConstraints(headingLabel.constraints)
        messageLabel.removeConstraints(messageLabel.constraints)
        
        if heading == nil{
            messageLabel.text = message
            messageLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
            messageLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
            messageLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
            messageLabel.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
        }else{
            
            topView.addSubview(headingLabel)
            headingLabel.text = heading
            messageLabel.text = message
            
            messageLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
            messageLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
            messageLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.65).isActive = true
            messageLabel.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
            
            headingLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor).isActive = true
            headingLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
            headingLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
            headingLabel.heightAnchor.constraint(equalTo: topView.heightAnchor,multiplier:0.3).isActive = true
        }
        
    }
    
    private func setSingleAction(){
        
        setCancelButton()
        
        cancel.leadingAnchor.constraint(equalTo: roundView.leadingAnchor).isActive = true
        cancel.bottomAnchor.constraint(equalTo: roundView.bottomAnchor).isActive = true
        cancel.topAnchor.constraint(equalTo: topSep.bottomAnchor).isActive = true
        cancel.trailingAnchor.constraint(equalTo: roundView.trailingAnchor).isActive = true
        layoutIfNeeded()
    }
    
    private func setDoubleActions(){
        
        setCancelButton()
        
        action = button(actionTitle, .red)
        
        guard let action = action else {
            return
        }
        roundView.addSubview(action)
        
        action.trailingAnchor.constraint(equalTo: roundView.trailingAnchor).isActive = true
        action.bottomAnchor.constraint(equalTo: roundView.bottomAnchor).isActive = true
        action.heightAnchor.constraint(equalTo: roundView.heightAnchor, multiplier: 0.2).isActive = true
        
        let midSep = uiView()
        midSep.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        roundView.addSubview(midSep)
        
        midSep.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        midSep.widthAnchor.constraint(equalToConstant: 0.8).isActive = true
        midSep.bottomAnchor.constraint(equalTo: roundView.bottomAnchor).isActive = true
        midSep.topAnchor.constraint(equalTo: cancel.topAnchor).isActive = true
        
        cancel.leadingAnchor.constraint(equalTo: roundView.leadingAnchor).isActive = true
        cancel.bottomAnchor.constraint(equalTo: roundView.bottomAnchor).isActive = true
        cancel.topAnchor.constraint(equalTo: topSep.bottomAnchor).isActive = true
        cancel.trailingAnchor.constraint(equalTo: midSep.leadingAnchor).isActive = true
        
        action.leadingAnchor.constraint(equalTo: midSep.trailingAnchor).isActive = true
        
        layoutIfNeeded()
    }
    
    private func setCancelButton(){
        cancel = button(Constants.CANCEL.uppercased(), .white)
        cancel.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        roundView.addSubview(cancel)
    }
    
    //MARK:- SUBVIEWS
    private var roundView = { () -> RoundView in
        let roundView = RoundView(radiusMultiplier: 0.08)
        return roundView
    }()
    
    private var messageLabel = { () -> Label in
        let label = Label(textAlignment: .center, fontType: .regular, fontSize: FontSize.sub_title_22)
        return label
    }()
    
    private var headingLabel = { () -> Label in
        let label = Label(textAlignment: .center, fontType: FontType.demi_bold, fontSize: FontSize.sub_title_25)
        return label
    }()
    
    private var button = { (text:String?,textColor:UIColor) -> UIButton in
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.medium.rawValue, size: 12)
        button.setTitleColor(textColor, for: .normal)
        return button
    }
    
    private var uiView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
