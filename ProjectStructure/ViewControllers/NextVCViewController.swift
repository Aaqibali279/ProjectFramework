//
//  NextVCViewController.swift
//  ProjectStructure
//
//  Created by osx on 17/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit

class NextVCViewController: ViewController {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let uiView = View()
        view.addSubview(uiView)
        uiView.backgroundColor = .blue
        uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        uiView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        uiView.setAspectRatio(multiplier: 1)
        
        setGesture(view: uiView, selector: #selector(backAction))
        uiView.dropShadow()
        
    }
    
    
}
