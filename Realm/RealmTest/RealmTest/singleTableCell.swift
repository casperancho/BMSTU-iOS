//
//  singleCell.swift
//  RealmTest
//
//  Created by Артем Закиров on 19.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit

class singleTableCell: UITableViewCell {
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func go(name: String, color: String, gender: String){
        colorLabel.text = "Цвет: " + color
        genderLabel.text = "Пол: " + gender
        nameLabel.text = "Имя: " + name
        
    }
  
}
