//
//  ViewController.swift
//  Map
//
//  Created by Артем Закиров on 05.12.2018.
//  Copyright © 2018 bmstu. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in Moscow
        let initialLocation = CLLocation(latitude: 55.751244, longitude: 37.618423)
        // Do any additional setup after loading the view, typically from a nib.
        centerMapOnLocation(location: initialLocation)
        
        mapView.addAnnotation(shop)
    }

    
    let shop = Shop(title: "Avenue", locationName: "", discipline: "shopping center", coordinate: CLLocationCoordinate2D(latitude: 55.663019, longitude: 37.480993))
    
    let regionRadius: CLLocationDistance = 20000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    // Annotation right callout accessory opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: shop.subtitle!]
        let placemark = MKPlacemark(coordinate: shop.coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Shop
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}

