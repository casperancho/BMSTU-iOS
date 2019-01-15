//
//  ViewController.swift
//  Just_alamofire
//
//  Created by Артем Закиров on 21.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBAction func imwork(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.work()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


    func work(){
        Alamofire.request("https://images.ua.prom.st/1085232722_w640_h640_3912_01.jpg").responseImage {
            response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                    self.image.image = image
                
                
                print("image downloaded: \(image)")
            }
        }
    }
}

