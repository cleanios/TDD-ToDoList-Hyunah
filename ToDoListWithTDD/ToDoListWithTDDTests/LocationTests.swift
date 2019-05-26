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
        let location = Location(name: "Wakanda")
        XCTAssertEqual(location.name, "Wakanda", "Initializer should set longitude")
    }
    
    func testWhenLocationDifferens_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "spiderMan",
                                 itemDescription: "톰 홀랜드",
                                 timeStamp: 0.0,
                                 location: Location(name: "New York"))
        let secondItem = ToDoItem(title: "ironMan",
                                  itemDescription: "로다주",
                                  timeStamp: 0.0,
                                  location: Location(name: "Hong kong"))
        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenLongitudeDifferes_ShouldBeNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0,
                                                     longitude: 1.0)
        let firstLocation = Location(name: "New York",
                                     coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0,
                                                      longitude: 0.0)
        let secondLocation = Location(name: "Hong kong",
                                      coordinate: secondCoordinate)
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    
    func performNotEqualTestWithLocationProperties(firstName: String,
                                                   secondName: String,
                                                   firstLongLat: (Double, Double)?,
                                                   secondLongLat: (Double, Double)?,
                                                   line: UInt = #line) {
        let firstCoord: CLLocationCoordinate2D?
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0,
                                                longitude: firstLongLat.1)
        } else { firstCoord = nil }
        
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        let secondCoord: CLLocationCoordinate2D?
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0,
                                                longitude: secondLongLat.1)
        } else { secondCoord = nil }
        
        let secondLocation = Location(name: secondName,
                                      coordinate: secondCoord)
        XCTAssertNotEqual(firstLocation, secondLocation, line: line)
    }
    
    func testWhenLatitudeDifferes_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties(firstName: "New York",
                                                  secondName: "Hong kong",
                                                  firstLongLat: (1.0, 0.0),
                                                  secondLongLat: (0.0, 0.0))
    }
    
    func testWhenOneHasCoordinateAndTheOtherDoesnt_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties(firstName: "New York",
                                                  secondName: "Hong kong",
                                                  firstLongLat: (1.0, 0.0),
                                                  secondLongLat: nil)
    }
}
