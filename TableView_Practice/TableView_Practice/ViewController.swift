//
//  ViewController.swift
//  TableView_Practice
//
//  Created by bro on 2023/09/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var uiTableView: UITableView!
    
    var modelData = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return modelData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = modelData[indexPath.row]
        
        return cell
    }
}
