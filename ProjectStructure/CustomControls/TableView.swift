//
//  TableView.swift
//  GenericTableView
//
//  Created by Aqib Ali on 14/01/19.
//  Copyright © 2019 osx. All rights reserved.
//
import UIKit
class TableView<Model,Cell:TableViewCell<Model>>: UITableView ,UITableViewDelegate,UITableViewDataSource{
    
    
    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        bounces = false
        separatorStyle = .none
        register(Cell.self, forCellReuseIdentifier: cellId)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var list:[Model]?{
        didSet{
            reloadData()
        }
    }
    var cellId = "CellId"
    var heightForRow:CGFloat = 50
    var didSelectRowAt:DidSelectRowAt<Model>?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! Cell
        cell.item = list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt?(indexPath,list?[indexPath.row])
    }
    
}
