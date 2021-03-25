//
//  CustomAnnotation.swift
//  MapsApp
//
//  Created by macbook on 25.03.2021.
//

import Foundation
import MapKit

class CustomAnnotation {
    var title: String
    var subtitle: String
    var coordinate: CLLocationCoordinate2D
    
    init(_ title: String, _ subtitle: String, _ coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
