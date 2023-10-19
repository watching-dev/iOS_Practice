//
//  TableDataResource.swift
//  TableView_Practice
//
//  Created by bro on 2023/09/11.
//

import UIKit

// UITableViewDataSource를 별개의 class로 정의, NSObject는 필수_없으면 에러남
class TableDataResource: NSObject, UITableViewDataSource {

    // 어떤 데이터 형식으로 할건지 정의
    var dataList: [String] = []
    
    // tableView에 데이터를 얼마나 출력할건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataList.count
    }

    // UITableViewCell에 어떤식으로 출력할건지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 재사용되는 cell 생성, story board에 있는 tableViewCell과 같은 identifier 작성
        // tableView.dequeueReusableCell(withIdentifier: )로 하면 옵셔널 에러 뜸
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // cell에 출력할 데이터 전달
        // custom cell을 만들지 않으면 default 형태의 cell을 출력
        // cell에 기본적으로 제공하는 textLabel이 있고 그 label에 text 값 입력
        cell.textLabel?.text = dataList[indexPath.row]

        // UITableViewCell을 리턴하라고 했으니까 리턴해줌
        return cell
    }
}
