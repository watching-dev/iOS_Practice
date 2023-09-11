//
//  ViewController.swift
//  TableView_Practice
//
//  Created by bro on 2023/09/11.
//

import UIKit
/*
 
    필요 준비물
    UITableView, UITableViewDataSource, Model
 
 */
class ViewController: UIViewController {

    @IBOutlet weak var uiTableView: UITableView!
    
    var dataSource = TableDataResource()
    var dataModel = TableDataModel(dataList: ["1", "2"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataList = dataModel.dataList
        uiTableView.dataSource = dataSource
    }
}
