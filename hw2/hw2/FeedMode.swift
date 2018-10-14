//
//  FeedMode.swift
//  hw2
//
//  Created by Артем Закиров on 13.10.2018.
//  Copyright © 2018 CasCorp. All rights reserved.
//

import Foundation
import UIKit
final class FeedMode {
    var tovars : [Tovar]
    
    init() {
//        let image1 : UIImage = UIImage.init(named:"sendmelocation") ?? UIImage()
        let tovar1 = Tovar(id: 1, image: #imageLiteral(resourceName: "sendmelocation.jpg"), name: "Send me location", desc: "Official T-Shirt Khabib", price: 123.123)
        let tovar2 = Tovar(id: 2, image: #imageLiteral(resourceName: "thekingisback.jpg"), name: "The King is Back", desc: "Conor", price: 12)
        let tovar3 = Tovar(id: 3, image: #imageLiteral(resourceName: "teplo.jpg"), name: "Shapka", desc: "Teplo bydet es'zhi", price: 228)
        let tovar4 = Tovar(id: 4, image: #imageLiteral(resourceName: "sendmelocation.jpg"), name: "Send me location", desc: "Official T-Shirt Khabib", price: 123.123)
        tovars = [tovar1,tovar2,tovar3,tovar4]
    }
}

//#imageLiteral(resourceName: "teplo.jpg")
