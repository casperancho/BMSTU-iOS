//
//  ViewController.swift
//  rgb
//
//  Created by Артем Закиров on 28.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    @IBAction func greenChanged(_ sender: Any) {
        updateColor()
        greenLabel.text = "\(greenSlider.value)"
    }
    
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBAction func blueChanged(_ sender: Any) {
        updateColor()
        blueLabel.text = "\(blueSlider.value)"
    }
    
    
    @IBOutlet weak var greenLabel: UILabel!
    @IBAction func redValueChaged(_ sender: Any) {
        updateColor()
        redLabel.text = "\(redSlider.value)"
    }
    
    
    func setting(){
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
    }
    
    func updateColor(){
        roundView.backgroundColor = UIColor(red: CGFloat(redSlider!.value)/255.0, green: CGFloat(greenSlider!.value)/255.0, blue: CGFloat(blueSlider!.value)/255.0, alpha: 1)
    }

    override func viewDidLoad() {
        setting()
        super.viewDidLoad()
        
        roundView.backgroundColor = UIColor(red: CGFloat(redSlider!.value)/255.0, green: CGFloat(greenSlider!.value)/255.0, blue: CGFloat(blueSlider!.value)/255.0, alpha: 1)
        roundView.layer.cornerRadius = roundView.frame.size.height / 2.0
        roundView.clipsToBounds = true
        
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        roundView.addGestureRecognizer(doubleTapGestureRecognizer)
        mainView.addGestureRecognizer(doubleTapGestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func doubleTapped() {
        roundView.isHidden = !roundView.isHidden
    }

}

