//
//  TextField.swift
//  ProjectStructure
//
//  Created by osx on 18/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

protocol TextFieldDelegate {
    func condition(textField: UITextField, text: String) -> Bool
    func showError()
    func hideError()
}


import UIKit
class TextField: UITextField,UITextFieldDelegate {
    
    /*
     This Delagate is intentionally added to be used in other views to show error and remove error
     */
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textFieldDelegate:TextFieldDelegate?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        
        guard let condition = textFieldDelegate?.condition(textField: textField, text: text) else {
            return true
        }
        if condition {
            textFieldDelegate?.showError()
        }else{
            textFieldDelegate?.hideError()
        }
        
        return true
    }
}

