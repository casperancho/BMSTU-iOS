//
//  FullScreenImageViewController.swift
//  SportShop
//
//  Created by Кирилл Володин on 24.09.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import UIKit

class FullScreenImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var good: Good!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = good.image
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc func swiped() {
        dismiss(animated: true, completion: nil)
    }
}
