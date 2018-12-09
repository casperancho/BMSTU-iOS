//
//  Shop.swift
//  Map
//
//  Created by Артем Закиров on 05.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import Foundation
import MapKit

class Shop: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
