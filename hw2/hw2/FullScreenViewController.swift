//
//  FullScreenImageViewController.swift
//  hw2
//
//  Created by Артем Закиров on 15.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var tovar : Tovar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = tovar.image
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc func swiped() {
        dismiss(animated: true, completion: nil)
    }
}
