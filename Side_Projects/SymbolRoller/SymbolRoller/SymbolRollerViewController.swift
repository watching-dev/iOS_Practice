//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by watching-dev on 2023/09/17.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // TO-DO:
        // - symbols에서 랜덤으로 하나 추출
        // - 이미지와 텍스트 연결
        
        reload()
        print("view did load")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        reload()
        print("tap")
    }
    
    func reload() {
        
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    
}
