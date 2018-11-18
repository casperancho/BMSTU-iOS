//
//  Cat.swift
//  RealmTest
//
//  Created by Артем Закиров on 18.11.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import RealmSwift

class Cat : Object  {
    
    @objc dynamic var name : String?
    @objc dynamic var color : String?
    @objc dynamic var gender : String?
    
    
}
