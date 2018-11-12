//
//  animeSelf.swift
//  collectionViewApp
//
//  Created by Артем Закиров on 01.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import UIKit

struct Anime{
    let name : String
    let genre : String
    let episodes : String
    let episodes_length : String
    let description : String
    let image : UIImage
}


//extension Anime{
//
//    init?(dict : NSDictionary) {
//        guard
//            let name = dict["name"] as? String,
//            let genre = dict["type"] as? String,
//            let episodes = dict["episodes"] as? String,
//            let episodes_length = dict["episode_length"] as? String,
//            let description = dict["description"] as? String
//            else {return nil}
//
//        self.name = name
//        self.genre = genre
//        self.episodes = episodes
//        self.episodes_length = episodes_length
//        self.description = description
////        self.image = image
//    }
//
//}
