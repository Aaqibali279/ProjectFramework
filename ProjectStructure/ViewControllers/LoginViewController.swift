//
//  LoginViewController.swift
//  ProjectStructure
//
//  Created by Aqib Ali on 18/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit

class LoginViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = Label(textAlignment: .center, fontType: .bold, fontSize: .text_15)
        view.addSubview(label)
        label.text = "LOGIN"
        label.fillSuperView()
        setGesture(view: label, selector: #selector(launch))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavBar()
        setNavBarTitle(title: "LOGIN")
        setBackButtonInNavBar()
    }
    
    @objc
    func launch(){
        navigationController?.pushViewController(CustomTabBarController(), animated: true)
    }

}
