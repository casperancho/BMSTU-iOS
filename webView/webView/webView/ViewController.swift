//
//  ViewController.swift
//  webView
//
//  Created by Артем Закиров on 19.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    
    @IBAction func safariButton(_ sender: Any) {
        
        let viewController = SFSafariViewController(url: URL(string: "https://vk.com")!)
        self.present(viewController,animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let url = URL(string: "https://reebok.ru")
//        let request = URLRequest(url: url!)
//        webView.load(request as URLRequest)
//        // Do any additional setup after loading the view, typically from a nib.
    }


}

