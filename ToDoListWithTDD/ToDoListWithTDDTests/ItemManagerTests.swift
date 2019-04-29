//
//  ItemManagerTests.swift
//  ToDoListWithTDDTests
//
//  Created by Hyunah on 29/04/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import ToDoListWithTDD

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!
    
    override func setUp() {
        sut = ItemManager()
    }
    
    func testTodoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0, "Initially toDo count should be 0")
    }
    
    func testTodoCount_AfterAddingOneItem() {
        sut.addItem(ToDoItem(title: "Avengers"))
        XCTAssertEqual(sut.toDoCount, 1, "toDoCount should be 1")
    }
}
