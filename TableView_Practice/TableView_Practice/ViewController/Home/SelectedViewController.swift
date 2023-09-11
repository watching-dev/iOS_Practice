//
//  SelectedViewController.swift
//  TableView_Practice
//
//  Created by bro on 2023/09/11.
//

import UIKit

// tableView에서 선택하면 이동하는 ViewController
// UIViewController를 상속받아야 함_아무것도 없이 하면 안뜸
class SelectedViewController: UIViewController {
    
    // story board에 생성, 연결되어 있는 tableView
    @IBOutlet weak var label: UILabel!
    
     // view가 올라오고 나서 동작할 기능 구현
     // 기본적으로 ViewController 생성할때 같이 작성하는거라 생각
     override func viewDidLoad() {
         
         // 구분이 되도록 배경색과 print 찍어줌
         self.view.backgroundColor = .yellow
         print("SelectedViewController")
     }
 }
