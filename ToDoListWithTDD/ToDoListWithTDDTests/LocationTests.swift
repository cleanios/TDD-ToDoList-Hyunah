//
//  LocationTests.swift
//  ToDoListWithTDDTests
//
//  Created by Hyunah on 29/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDoListWithTDD

class LocationTests: XCTestCase {
    
    func testInit_SholdSetNameAndCoordinate() {
//        let testCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Wakanda")
        XCTAssertEqual(location.name, "Wakanda", "Initializer should set longitude")
    }
    
    
}
