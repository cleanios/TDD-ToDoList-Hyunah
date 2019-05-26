//
//  Location+Extension.swift
//  ToDoListWithTDD
//
//  Created by Hyunah on 01/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import Foundation
import CoreLocation

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.coordinate?.longitude == rhs.coordinate?.longitude &&
        lhs.coordinate?.latitude == rhs.coordinate?.latitude &&
        lhs.name == rhs.name
        
    }
}
