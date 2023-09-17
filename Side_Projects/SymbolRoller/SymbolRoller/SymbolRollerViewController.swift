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
        
        imageView.image = UIImage(systemName: "moon")
        print("view did load")
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        print("tap")
    }
    
}
