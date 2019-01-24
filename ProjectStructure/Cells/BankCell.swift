//
//  BankCell.swift
//  GenericTableView
//
//  Created by Aqib Ali on 14/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit
class BankCell: TableViewCell<Bank> {
    
    override var item: Bank?{
        didSet{
            bankNameLabel.text = item?.bankName
            accountNumberLabel.text = item?.accountNumber
        }
    }
    
    private var bankNameLabel = { ()-> UILabel in
        let label = Label(textAlignment: .center, fontType: FontType.demi_bold, fontSize: FontSize.sub_title_22)
        return label
    }()
    
    private var accountNumberLabel = { ()-> UILabel in
        let label = Label(textAlignment: .center, fontType: FontType.demi_bold, fontSize: FontSize.sub_title_22)
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        selectionStyle = .none
        addSubview(bankNameLabel)

        bankNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bankNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bankNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bankNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        addSubview(accountNumberLabel)
        
        accountNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        accountNumberLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        accountNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        accountNumberLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    }
}

class AccountCell: CollectionViewCell<Bank> {
    
    override var item: Bank?{
        didSet{
            bankNameLabel.text = item?.bankName
            accountNumberLabel.text = item?.accountNumber
        }
    }
    
    private var bankNameLabel = { ()-> UILabel in
        let label = Label(textAlignment: .center, fontType: FontType.demi_bold, fontSize: FontSize.sub_title_22)
        return label
    }()
    
    private var accountNumberLabel = { ()-> UILabel in
        let label = Label(textAlignment: .center, fontType: FontType.demi_bold, fontSize: FontSize.sub_title_22)
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.backgroundColor = .white
        addSubview(bankNameLabel)
        
        bankNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bankNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bankNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bankNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(accountNumberLabel)
        
        accountNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        accountNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        accountNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        accountNumberLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
}

