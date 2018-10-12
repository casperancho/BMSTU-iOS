//
//  Good.swift
//  SportShop
//
//  Created by Кирилл Володин on 24.09.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import UIKit

final class Good {
    var id: Int
    var image: UIImage
    var name: String
    var company: String
    var price: Double
    
    init(id: Int, image: UIImage, name: String, company: String, price: Double) {
        self.id = id
        self.image = image
        self.name = name
        self.company = company
        self.price = price
    }
}
