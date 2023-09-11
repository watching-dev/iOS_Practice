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

class TableDataResource: NSObject, UITableViewDataSource {

    var dataList: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]

        return cell
    }
}

struct TableDataModel {

    let dataList: [String]

    init(dataList: [String]) {

        self.dataList = dataList
    }
}
