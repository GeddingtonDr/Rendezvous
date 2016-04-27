//
//  Pins.swift
//  Rendezvous
//
//  Created by Brandon Arroyo on 4/26/16.
//  Copyright © 2016 GeddingtonDr. All rights reserved.
//

import UIKit
import MapKit
import AddressBook
class Pins: NSObject, MKAnnotation {
    
    
    let title: String?
    let locationName: String

    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
      
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    

    
    
}
