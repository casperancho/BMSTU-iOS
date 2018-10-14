//
//  FeedModel.swift
//  SportShop
//
//  Created by Кирилл Володин on 24.09.2018.
//  Copyright © 2018 Кирилл Володин. All rights reserved.
//

import Foundation

final class FeedModel {
    var goods: [Good]
    
    init() {
        let good1 = Good(id: 1, image: #imageLiteral(resourceName: "img1"), name: "France Authentic\nJersey 2018", company: "NIKE", price: 138)
        let good2 = Good(id: 2, image: #imageLiteral(resourceName: "img2"), name: "Brasil Authentic\nJersey 2018", company: "NIKE", price: 149)
        let good3 = Good(id: 3, image: #imageLiteral(resourceName: "img3"), name: "Mexico Authentic\nJersey 2018", company: "ADIDAS", price: 99)
        goods = [good1, good2, good3]
    }
}
//#imageLiteral(resourceName: "img1")
