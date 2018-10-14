//
//  tovar.swift
//  hw2
//
//  Created by Артем Закиров on 13.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import UIKit

final class Tovar
{
    var id : Int
    var image : UIImage
    var name : String
    var desc : String
    var price : Double
    
    init(id : Int, image : UIImage, name : String, desc : String, price : Double) {
        self.id = id
        self.image = image
        self.name = name
        self.desc = desc
        self.price = price
    }
}
