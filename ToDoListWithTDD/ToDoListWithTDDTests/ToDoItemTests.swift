//
//  ToDoItemTests.swift
//  ToDoListWithTDDTests
//
//  Created by Hyunah on 27/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import ToDoListWithTDD

class ToDoItemTests: XCTestCase {
    var firstItem: ToDoItem?
    var secondITem: ToDoItem?
    
    override func setUp() {
        firstItem = ToDoItem(title: "Coffee",
                             itemDescription: "with cake",
                             timeStamp: 0.0,
                             location: nil)
        
        secondITem = ToDoItem(title: "Stake",
                              itemDescription: "with wine",
                              timeStamp: 0.0,
                              location: Location(name: "NewYork"))
    }
    
    /// STEP1: We need initializer
    
    func testInit_ShouldTakeTitle() {
        _ = ToDoItem(title: "Avengers")
    }
    
    func testInit_ShouldTakeTitleAndDescription() {
        _ = ToDoItem(title: "Avengers",
                     itemDescription: "EndGame")
    }
    
    func testInit_ShouldSetTitleAndDescription() {
        let item = ToDoItem(title: "Avengers",
                            itemDescription: "EndGame")
        XCTAssertEqual(item.itemDescription,
                       "EndGame",
                       "Initializer should set the description")
    }
    
    /// timeStamp => due date
    func testInit_ShouldSetTitleAndDescriptionAndTimeStamp() {
        let item = ToDoItem(title: "Avengers",
                            itemDescription: "EndGame",
                            timeStamp: 0.0)
        XCTAssertEqual(item.timeStamp, 0.0, "Initializer should set the timestamp")
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimeStampAndLocation() {
        let location = Location(name: "Wakanda")
        let item = ToDoItem(title: "Avengers",
                            itemDescription: "EndGame",
                            timeStamp: 0.0,
                            location: location)
        XCTAssertEqual(item.location?.name, location.name, "Initializer should set the Locaiton")
    }
    
    func testEqualItems_ShouldBeEqual() {
        let firstItem = ToDoItem(title: "First")
        let secondItem = ToDoItem(title: "First")
        XCTAssertEqual(firstItem, secondItem)
    }
    
    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        XCTAssertNotEqual(firstItem, secondITem)
    }
    
    func testWhenTimestampDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "Stake",
                             itemDescription: "with wine",
                             timeStamp: 1.0,
                             location: nil)
        
        let secondITem = ToDoItem(title: "Stake",
                              itemDescription: "with wine",
                              timeStamp: 0.0,
                              location: nil)
        XCTAssertNotEqual(firstItem, secondITem)
    }
    
    func testWhenDescriptionDifferes_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "Stake",
                                 itemDescription: "with cake",
                                 timeStamp: 1.0,
                                 location: nil)
        
        let secondITem = ToDoItem(title: "Stake",
                                  itemDescription: "with wine",
                                  timeStamp: 0.0,
                                  location: nil)
        XCTAssertNotEqual(firstItem, secondITem)
    }
}
