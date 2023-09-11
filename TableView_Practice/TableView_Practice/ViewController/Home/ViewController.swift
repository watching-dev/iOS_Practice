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

    // story board에 생성, 연결되어 있는 tableView
    @IBOutlet weak var uiTableView: UITableView!
    
    // tableView의 짝궁인 dataSource를 별개의 class로 만들어 사용
    var dataSource = TableDataResource()
    // 어떤 형식으로 출력할건지 정의한 데이터 생성
    var dataModel = TableDataModel(dataList: ["1", "2"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate를 ViewController에게 위임하기 위해 self 지정
        // 더 쉽게는 didSelectRowAt 함수를 사용하기 위해
        uiTableView.delegate = self
        // dataModel을 통해 생성된 data를 dataSource로 전달
        dataSource.dataList = dataModel.dataList
        // 인스턴스 객체로 만든 dataSource를 tableView에 연결된 dataSource에 저장
        // 이미 연결된 dataSource에 저장하기 때문에 tableView.dataSource = self 할 필요 없음
        uiTableView.dataSource = dataSource
    }
}

// UITableViewDelegate 사용하기 위해 extension을 사용해 확장
// 코드를 쉽게 보기위해 구분하는 식으로도 사용
extension ViewController: UITableViewDelegate {

    // UITableViewDelegate에서 제공하는 didSelectRowAt 함수 사용
    // cell이 선택 됐을때 동작하는 기능 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("didselect: \(indexPath.row)")

        // 현재 화면위에 SelectedViewController 생성해서 띄움
        let vc: UIViewController = SelectedViewController()
        present(vc, animated: true)
    }
}
