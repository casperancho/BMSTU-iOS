//
//  ViewController.swift
//  firstApp
//
//  Created by Артем Закиров on 08.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       button.backgroundColor = .yellow
        
    }


    @IBAction func act1(_ sender: Any) {
        button2.backgroundColor = .red
        
    }
}

