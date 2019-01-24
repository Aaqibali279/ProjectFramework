//
//  ViewController.swift
//  GenericTableView
//
//  Created by Aqib Ali on 14/01/19.
//  Copyright © 2019 osx. All rights reserved.
//



import UIKit
import Foundation
class MainViewController:ViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        setNavBar()
        setNavBarTitle(title: "Main")
//        setBackButtonInNavBar()
//        let label = Label(textAlignment: .center, fontType: .bold, fontSize: .text_15)
//        view.addSubview(label)
//        label.textColor = .white
//        label.text = "Project Structure\n\n\n\n[ANIMATE]"
//        label.fillSuperView()
//        setGesture(view: label, selector: #selector(launch))
        
        
        let button = Button()
        button.setTitle("Animate", for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.regular.rawValue, size: FontSize.sub_title_28.rawValue)
        button.setBackgroundColor(.purple, for: .highlighted)
        button.setBackgroundColor(.gray, for: .normal)
        
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        
        button.addTarget(self, action: #selector(launch), for: .touchUpInside)
        
//        var banks = [Bank]()
//
//        for index in 0...10{
//            banks.append(Bank.init(bankName: "Bank\(index)", accountNumber: "\(index * 10000)"))
//        }
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        let collectionView = CollectionView<Bank,AccountCell>(flowLayout:layout)
//        view.addSubview(collectionView)
//        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//
//        collectionView.itemSize = CGSize.init(width: view.frame.width/2, height: view.frame.width/2)
//        collectionView.list = banks
//        collectionView.backgroundColor = .red
//        collectionView.didSelectRowAt = { (indexPath,modal) -> Void in
//            print(modal?.accountNumber ?? "")
//        }
        
//        Network().request(url: Constants.BASE_URL, method: .get,queryItems:["q":"USD_INR"], success: { (currency:Currency) in
//            print(currency.results?.USD_INR?.val ?? "")
//        }) { (message) in
//            print(message)
//        }
        
        
        
//        let tableView = TableView<Bank, BankCell>()
//        view.addSubview(tableView)
//        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        tableView.list = banks
//        tableView.didSelectRowAt = { (indexPath,bank) -> Void in
//            print("\(indexPath.row)",bank?.bankName)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc
    func launch() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}

