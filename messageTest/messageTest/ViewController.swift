//
//  ViewController.swift
//  messageTest
//
//  Created by Артем Закиров on 05.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    

    @IBAction func sendMessage(_ sender: Any) {
        displayMessageInterface()
    }
    
    func displayMessageInterface(){
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        composeVC.recipients = ["89153836299"]
        composeVC.body = "I LOVE YOU!"
        
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

