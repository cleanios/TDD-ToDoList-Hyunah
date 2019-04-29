//
//  Location.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 28/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String,
         coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
