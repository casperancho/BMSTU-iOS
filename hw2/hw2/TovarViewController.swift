//
//  GoodViewController.swift
//  hw2
//
//  Created by Артем Закиров on 14.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

final class TovarViewController: UIViewController
{
    @IBOutlet weak var tovarImageView: UIImageView!
    @IBOutlet weak var tovarNameLabel: UILabel!
    @IBOutlet weak var tovarDescLabel: UILabel!
    @IBOutlet weak var tovarPriceLabel: UILabel!
    
    var tovar : Tovar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        tovarImageView.image = tovar.image
        tovarNameLabel.text = tovar.name
        tovarDescLabel.text = tovar.desc
        tovarPriceLabel.text = "$\(tovar.price)"
   
    let gesture = UITapGestureRecognizer(target: self, action: #selector(openInFullScreen))
    tovarImageView.addGestureRecognizer(gesture)
 }
    
    @objc func openInFullScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController 
        vc.tovar = tovar
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func showFullImage(_ sender: Any) {
        openInFullScreen()
    }
}
