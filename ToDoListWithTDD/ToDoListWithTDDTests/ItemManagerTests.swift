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
    
    func testToDoTestAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = ToDoItem(title: "Avengers")
        sut.addItem(item)
        let returnedItem = sut.itemAtIndex(0)
        XCTAssertEqual(item.title, returnedItem.title, "Should be the same item")
    }
    
    /// The user has to be able to check the items
    func testCheckingItem_ChangesCountOfToDoAndOfToDoAndOfDoneItems() {
        sut.addItem(ToDoItem(title: "Avengers"))
        sut.checkItemAtIndex(0)
        XCTAssertEqual(sut.toDoCount, 0, "toDoCount should be 0")
        XCTAssertEqual(sut.doneCount, 1, "doneCount should be 1")
    }
    
    func testCheckingItem_RemovesItFromTheToDoItemList() {
        let firstItem = ToDoItem(title: "Avengers EndGame")
        let secondItem = ToDoItem(title: "Avengers Infinity war")
        
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, secondItem.title)
    }
    
    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let item = ToDoItem(title: "Avengers")
        sut.addItem(item)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.doneItemAtIndex(0)
        XCTAssertEqual(returnedItem.title
            , item.title, "Should be the same item")
    }
    
    func testRemoveAllItems_ShouldReturnInCountsBeZero() {
        sut.addItem(ToDoItem(title: "First"))
        sut.addItem(ToDoItem(title: "Second"))
        sut.addItem(ToDoItem(title: "Third"))
        sut.checkItemAtIndex(0)
        sut.removeAllItems()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.toDoCount, 0)
    }
    
    /// Ensuring uniqueness
    func testAddingTheSameItem_DoesNotIncreaseCount() {
        sut.addItem(ToDoItem(title: "First"))
        sut.addItem(ToDoItem(title: "First"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
