//
//  reebokWebView.swift
//  webView
//
//  Created by Артем Закиров on 19.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class ReebokWebView : UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://reebok.ru");
        let request = URLRequest(url: url!);
        webView.load(request);
    }
}
