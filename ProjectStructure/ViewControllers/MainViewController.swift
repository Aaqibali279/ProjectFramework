//
//  ViewController.swift
//  GenericTableView
//
//  Created by osx on 14/01/19.
//  Copyright © 2019 osx. All rights reserved.
//



import UIKit
import Foundation
class MainViewController:ViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
//        navigationController?.isNavigationBarHidden = true
//        let label = Label(textAlignment: .center, fontType: .bold, fontSize: .text_15)
//        view.addSubview(label)
//        label.text = "Project Structure"
//        label.fillSuperView()
        
        
        let uiView = View()
        view.addSubview(uiView)
        uiView.backgroundColor = .red
        uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        uiView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        uiView.setAspectRatio(multiplier: 1)
        
//        view.layoutIfNeeded()
        setGesture(view: uiView, selector: #selector(launch))
        uiView.dropShadow()
        
        
        
        
        
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
    
    @objc
    func launch() {
        navigationController?.pushViewController(NextVCViewController(), animated: true)
    }
    
}

