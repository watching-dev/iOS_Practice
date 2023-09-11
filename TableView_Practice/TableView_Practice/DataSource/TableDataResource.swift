//
//  TableDataResource.swift
//  TableView_Practice
//
//  Created by bro on 2023/09/11.
//

import UIKit

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
