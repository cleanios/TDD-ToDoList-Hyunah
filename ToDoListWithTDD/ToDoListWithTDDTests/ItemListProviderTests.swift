//
//  ItemListProviderTests.swift
//  ToDoListWithTDDTests
//
//  Created by Hyunah on 23/05/2019.
//  Copyright © 2019 hyunable. All rights reserved.
//

import XCTest
@testable import ToDoListWithTDD

class ItemListProviderTests: XCTestCase {
    
    var controller: ItemListViewController!
    var sut: ItemListDataProvider!
    var tableView: UITableView!
    var mockTableView: UITableView!

    override func setUp() {
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        tableView = UITableView()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: ItemListViewController.identifier) as? ItemListViewController
        _ = controller.view
        tableView.dataSource = sut
        
        mockTableView = MockTableView(frame: CGRect.zero)
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
    }
    
    /// numberOfSections's Default is One
    func test_NumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberRowsInFirstSection_IsToDoCount() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.addItem(ToDoItem(title: "Second"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberRowInSecondSection_IsDoneCount() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        sut.itemManager?.addItem(ToDoItem(title: "Second"))
        sut.itemManager?.checkItemAtIndex(0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.itemManager?.checkItemAtIndex(0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    /// 해당 셀의 종류가 ItemCell
    func testCellForRow_ReturnItemCell() {
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func testCellForRow_DequesCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        mockTableView.reloadData()
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequed)      /// 디큐가 되면 내부에서 true가 되게 끔 설정되었음
    }
    
    func testConfigCell_GetsCalledInCellForRow() {
        let toDoItem = ToDoItem(title: "First", itemDescription: "First Description")
        sut.itemManager?.addItem(toDoItem)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? MockItemCell
        XCTAssertEqual(cell?.toDoItem, toDoItem)
    }
    
    func testCellInSectionTwo_GetsConfiguredWithDoneItem() {
        let firstItem = ToDoItem(title: "First", itemDescription: "First Description")
        sut.itemManager?.addItem(firstItem)
        let secondItem = ToDoItem(title: "second", itemDescription: "second Description")
        sut.itemManager?.addItem(secondItem)
        
        sut.itemManager?.checkItemAtIndex(1)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(item: 0, section: 1)) as! MockItemCell
        
        XCTAssertEqual(cell.toDoItem, secondItem)
    }
}

extension ItemListProviderTests {
    class MockTableView: UITableView {
        var cellGotDequed = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequed = true
            return super.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell {
        var toDoItem: ToDoItem?
        
        override func configCellWithItem(item: ToDoItem) {
            toDoItem = item
        }
    }
}
