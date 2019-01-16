//
//  CollectionView.swift
//  GenericTableView
//
//  Created by osx on 15/01/19.
//  Copyright © 2019 osx. All rights reserved.
//

import UIKit

class CollectionView<Modal,Cell:CollectionViewCell<Modal>>: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    init(flowLayout:UICollectionViewFlowLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        delegate = self
        dataSource = self
        bounces = false
        translatesAutoresizingMaskIntoConstraints = false
        register(Cell.self, forCellWithReuseIdentifier: cellId)
    }
    
    var didSelectRowAt:DidSelectRowAt<Modal>?
    var itemSize = CGSize.init(width: UIScreen.main.bounds.width, height: 100)
    var cellId = "CellId"
    
    var list:[Modal]?{
        didSet{
            reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Cell
        cell.item = list?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectRowAt?(indexPath,list?[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
