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
        
        var banks = [Bank]()
        for index in 0...10{
            banks.append(Bank.init(bankName: "Bank\(index)", accountNumber: "\(index * 10000)"))
        }

        
        let tableView = TableView<Bank, BankCell>()
        view.addSubview(tableView)
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.list = banks
        tableView.didSelectRowAt = { (indexPath,bank) -> Void in
            print("\(indexPath.row)",bank?.bankName)
        }

    }
    
    
}
